--==============================================================--
-- Smart Dodge – Skill Timing Manager
-- Quản lý dữ liệu thời gian tồn tại (lifetime) và điểm nổ (hit delay) của chiêu thức.
-- Hỗ trợ 2 chế độ riêng biệt:
--   1. "Default Preset": Dùng bảng số liệu cứng chuẩn đã đo đạc (Zero I/O, cực kỳ ổn định)
--   2. "Trained Preset": Dùng dữ liệu JSON được huấn luyện riêng theo từng Map (Zero I/O khi né, nạp 1 lần vào RAM)
-- Chế độ Huấn luyện (Recording):
--   - Người chơi tự chơi chay trong map để thu thập nhịp chiêu thức
--   - Toàn bộ dữ liệu ghi nhận lưu tạm trong RAM, chỉ ghi ra file khi người chơi chủ động bấm Save
--==============================================================--

local services = require("@routes/DungeonQuest/core/services")
local shared = require("@routes/DungeonQuest/core/shared")
local dungeonCatalog = require("@routes/DungeonQuest/core/dungeonCatalog")
local notifier = require("@routes/DungeonQuest/core/notifier")
local macLib = require("@packages/Maclib")

local HttpService = game:GetService("HttpService")

local skillTimingManager = {}

--// Bảng Preset mặc định chuẩn (Hardcoded Presets)
local DEFAULT_PRESETS = {
	["mediumIceSpikes"] = { hitDelay = 1.1, totalLifetime = 1.5, isProjectile = false, skillType = "AoE" },
	["largeIceSpikes"] = { hitDelay = 1.4, totalLifetime = 1.8, isProjectile = false, skillType = "AoE" },
	["thirdBossMultiRings"] = { hitDelay = 2.0, totalLifetime = 2.8, isProjectile = false, skillType = "AoE" },
	["firstBossCrissCross"] = { hitDelay = 0.0, totalLifetime = 2.2, isProjectile = true, skillType = "Projectile" },
	["firstBossSeekingSpikes"] = { hitDelay = 0.0, totalLifetime = 2.5, isProjectile = true, skillType = "Projectile" },
	["firstBossBigSpike"] = { hitDelay = 0.0, totalLifetime = 2.0, isProjectile = true, skillType = "Projectile" },
	["firstBossBeamPart"] = { hitDelay = 0.0, totalLifetime = 2.0, isProjectile = true, skillType = "Projectile" },
	["secondBossMovingBeam"] = { hitDelay = 0.0, totalLifetime = 3.5, isProjectile = true, skillType = "Projectile" },
	["secondbossyelloworb"] = { hitDelay = 0.0, totalLifetime = 4.0, isProjectile = true, skillType = "Projectile" },
	["secondbossredorb"] = { hitDelay = 0.0, totalLifetime = 4.0, isProjectile = true, skillType = "Projectile" },
	["secondbossgreenorb"] = { hitDelay = 0.0, totalLifetime = 4.0, isProjectile = true, skillType = "Projectile" },
	["thirdBossMissile"] = { hitDelay = 0.0, totalLifetime = 3.5, isProjectile = true, skillType = "Projectile" },
}

--// Thư mục lưu dữ liệu theo Map
local SKILLS_FOLDER = macLib.Folder .. "/skills_data"

local function ensureFolder()
	if makefolder and isfolder then
		pcall(function()
			if not isfolder(macLib.Folder) then makefolder(macLib.Folder) end
			if not isfolder(SKILLS_FOLDER) then makefolder(SKILLS_FOLDER) end
		end)
	end
end

--// Trạng thái vận hành
local currentMode = "Default Preset" -- "Default Preset" | "Trained Preset"
local selectedMap = nil

-- RAM Data cho Mode 2 (Trained Preset)
local loadedTrainedData = {}
local loadedSkillCount = 0

-- RAM Data cho Huấn luyện Chơi chay (Recording Session)
local isRecording = false
local recordedSessionData = {}
local recordedSkillCount = 0
local totalSamplesCount = 0

local changeListeners = {}

local function fireChange()
	for _, cb in ipairs(changeListeners) do
		pcall(cb, {
			mode = currentMode,
			selectedMap = selectedMap,
			loadedCount = loadedSkillCount,
			isRecording = isRecording,
			recordedCount = recordedSkillCount,
			totalSamples = totalSamplesCount,
		})
	end
end

-- Chuẩn hóa tên file an toàn cho hệ thống tệp
local function sanitizeFileName(name)
	if not name or #name == 0 then return "Unknown" end
	return (name:gsub("[\\/:*?\"<>|]", "_"))
end

local function getFilePathForMap(mapName)
	ensureFolder()
	return SKILLS_FOLDER .. "/" .. sanitizeFileName(mapName) .. ".json"
end

--// ĐỌC DỮ LIỆU MAP VÀO RAM (Chỉ đọc 1 lần khi chọn map hoặc vào phòng)
function skillTimingManager.LoadMapData(mapName)
	mapName = mapName or selectedMap or shared.GetCurrentDungeonName() or "Unknown"
	local filePath = getFilePathForMap(mapName)

	table.clear(loadedTrainedData)
	loadedSkillCount = 0

	if isfile and isfile(filePath) then
		local ok, content = pcall(readfile, filePath)
		if ok and content and #content > 0 then
			local parseOk, parsed = pcall(function() return HttpService:JSONDecode(content) end)
			if parseOk and type(parsed) == "table" then
				for skillName, data in pairs(parsed) do
					if type(data) == "table" and type(data.avgLifetime) == "number" then
						loadedTrainedData[skillName] = {
							totalLifetime = tonumber(data.avgLifetime) or 2.0,
							hitDelay = tonumber(data.avgHitDelay) or (tonumber(data.avgLifetime) * 0.75),
							count = tonumber(data.count) or 1,
							minLifetime = tonumber(data.minLifetime),
							maxLifetime = tonumber(data.maxLifetime),
							isProjectile = data.isProjectile == true,
							skillType = data.skillType or (data.isProjectile and "Projectile" or "AoE"),
						}
						loadedSkillCount = loadedSkillCount + 1
					end
				end
			end
		end
	end

	fireChange()
	return loadedSkillCount
end

--// LẤY DỮ LIỆU TIMING (Được Smart Dodge / 3D Countdown gọi mỗi frame - 100% TRÊN RAM)
function skillTimingManager.GetSkillTiming(skillName)
	if currentMode == "Trained Preset" then
		local trained = loadedTrainedData[skillName]
		if trained and trained.totalLifetime then
			local hitDelay = trained.hitDelay
			if trained.isProjectile or hitDelay == 0 then
				hitDelay = 0.0
			end
			return trained.totalLifetime, (hitDelay or (trained.totalLifetime * 0.75))
		end
	end

	-- Mode 1 hoặc fallback: Bảng cứng Preset
	local preset = DEFAULT_PRESETS[skillName]
	if preset then
		return preset.totalLifetime or 2.0, preset.hitDelay or 1.5
	end

	return 2.5, 1.8
end

--// CHẾ ĐỘ HUẤN LUYỆN CHƠI CHAY (MANUAL TRAINING)
function skillTimingManager.SetRecordingEnabled(state)
	isRecording = state and true or false
	if isRecording then
		notifier.Notify("Skill Training", "Bắt đầu thu thập dữ liệu skill (Chơi chay)! Hãy tự né và đánh Boss.", 4)
	else
		notifier.Notify("Skill Training", ("Đã dừng ghi nhận. Thu thập được %d chiêu thức."):format(recordedSkillCount), 3)
	end
	fireChange()
end

function skillTimingManager.IsRecording()
	return isRecording
end

-- Ghi nhận 1 skill vào RAM buffer (hoàn toàn không đụng file I/O)
function skillTimingManager.RecordSkill(skillName, duration, hitDelay, isProjectile)
	if not isRecording then return end
	if not skillName or not duration or duration < 0.2 or duration > 30.0 then return end

	totalSamplesCount = totalSamplesCount + 1

	if isProjectile then
		hitDelay = 0.0
	end

	local rec = recordedSessionData[skillName]
	if not rec then
		local isProj = isProjectile and true or false
		recordedSessionData[skillName] = {
			count = 1,
			avgLifetime = duration,
			avgHitDelay = hitDelay or 0.0,
			minLifetime = duration,
			maxLifetime = duration,
			isProjectile = isProj,
			skillType = isProj and "Projectile" or "AoE",
		}
		recordedSkillCount = recordedSkillCount + 1
	else
		rec.count = rec.count + 1
		rec.isProjectile = rec.isProjectile or (isProjectile and true or false)
		rec.skillType = rec.isProjectile and "Projectile" or "AoE"

		if rec.isProjectile then
			-- Với Projectile: Sát thương gây ra liên tục suốt hành trình bay
			rec.avgHitDelay = 0.0

			-- Xử lý va chạm nổ sớm (Loại 1) vs Đạn xuyên thấu (Loại 2):
			-- Nếu duration quá ngắn so với thời gian bay tối đa từng đo (< 60% maxLifetime),
			-- đây là trường hợp đạn va chạm người chơi/tường nổ sớm -> Không kéo tụt avgLifetime!
			if duration >= (rec.maxLifetime * 0.60) then
				local weight = math.min(rec.count, 8)
				rec.avgLifetime = rec.avgLifetime + (duration - rec.avgLifetime) / weight
			end
			rec.maxLifetime = math.max(rec.maxLifetime, duration)
			rec.minLifetime = math.min(rec.minLifetime, duration)
		else
			-- Với AoE / Telegraph nổ mặt đất:
			local weight = math.min(rec.count, 8)
			rec.avgLifetime = rec.avgLifetime + (duration - rec.avgLifetime) / weight
			if hitDelay then
				rec.avgHitDelay = (rec.avgHitDelay or hitDelay) + (hitDelay - (rec.avgHitDelay or hitDelay)) / weight
			end
			rec.minLifetime = math.min(rec.minLifetime, duration)
			rec.maxLifetime = math.max(rec.maxLifetime, duration)
		end
	end

	local tag = rec.isProjectile and "🚀 Projectile" or "💥 AoE"
	print(("[SkillTimingManager] ✅ Recorded '%s' [%s] (hits: %d, avgLife: %.2fs, hitDelay: %.2fs) | RAM: %d unique, %d total hits")
		:format(skillName, tag, rec.count, rec.avgLifetime, rec.avgHitDelay or 0, recordedSkillCount, totalSamplesCount))

	fireChange()
end

-- Đóng gói dữ liệu Map thành định dạng JSON chuẩn có thụt dòng đẹp, dễ đọc, ưu tiên trường isProjectile và skillType
local function serializeSkillData(data)
	local lines = { "{\n" }
	local sortedKeys = {}
	for k in pairs(data) do
		table.insert(sortedKeys, k)
	end
	table.sort(sortedKeys)

	for i, skillName in ipairs(sortedKeys) do
		local info = data[skillName]
		local isProj = (info.isProjectile == true)
		local skillType = info.skillType or (isProj and "Projectile" or "AoE")
		local avgLife = tonumber(info.avgLifetime) or 2.0
		local hitDelay = tonumber(info.avgHitDelay) or (isProj and 0.0 or 1.5)
		local count = tonumber(info.count) or 1
		local minLife = tonumber(info.minLifetime) or avgLife
		local maxLife = tonumber(info.maxLifetime) or avgLife

		local comma = (i < #sortedKeys) and "," or ""
		table.insert(lines, string.format('  %q: {\n', skillName))
		table.insert(lines, string.format('    "skillType": %q,\n', skillType))
		table.insert(lines, string.format('    "isProjectile": %s,\n', isProj and "true" or "false"))
		table.insert(lines, string.format('    "avgLifetime": %.2f,\n', avgLife))
		table.insert(lines, string.format('    "avgHitDelay": %.2f,\n', hitDelay))
		table.insert(lines, string.format('    "count": %d,\n', count))
		table.insert(lines, string.format('    "minLifetime": %.2f,\n', minLife))
		table.insert(lines, string.format('    "maxLifetime": %.2f\n', maxLife))
		table.insert(lines, "  }" .. comma .. "\n")
	end
	table.insert(lines, "}")
	return table.concat(lines)
end

-- Lưu RAM buffer ra file của Map (Chỉ chạy 1 lần khi người chơi bấm nút Save)
function skillTimingManager.SaveRecordedData(targetMapName)
	targetMapName = targetMapName or selectedMap or shared.GetCurrentDungeonName() or "Unknown"
	if not (writefile and isfile) then
		notifier.Notify("Training Error", "Executor không hỗ trợ writefile!", 3)
		return false, 0
	end

	if recordedSkillCount == 0 then
		notifier.Notify("Skill Training", "Chưa có dữ liệu skill nào được ghi trong phiên chơi!", 3)
		return false, 0
	end

	local filePath = getFilePathForMap(targetMapName)
	local existingData = {}

	if isfile(filePath) then
		pcall(function()
			local raw = readfile(filePath)
			if raw and #raw > 0 then
				local parsed = HttpService:JSONDecode(raw)
				if type(parsed) == "table" then
					existingData = parsed
				end
			end
		end)
	end

	-- Merge session data vào existing data
	local mergedCount = 0
	for sName, sData in pairs(recordedSessionData) do
		local old = existingData[sName]
		if not old then
			sData.isProjectile = sData.isProjectile and true or false
			sData.skillType = sData.isProjectile and "Projectile" or "AoE"
			existingData[sName] = sData
		else
			old.count = (old.count or 1) + (sData.count or 1)
			if sData.isProjectile or old.isProjectile then
				old.isProjectile = true
				old.skillType = "Projectile"
				old.avgHitDelay = 0.0
				old.maxLifetime = math.max(old.maxLifetime or sData.maxLifetime, sData.maxLifetime)
				old.minLifetime = math.min(old.minLifetime or sData.minLifetime, sData.minLifetime)
				old.avgLifetime = math.max(old.avgLifetime or 0, sData.avgLifetime or 0)
			else
				old.isProjectile = false
				old.skillType = "AoE"
				old.avgLifetime = (old.avgLifetime + sData.avgLifetime) / 2
				old.avgHitDelay = ((old.avgHitDelay or old.avgLifetime * 0.75) + (sData.avgHitDelay or sData.avgLifetime * 0.75)) / 2
				old.minLifetime = math.min(old.minLifetime or sData.minLifetime, sData.minLifetime)
				old.maxLifetime = math.max(old.maxLifetime or sData.maxLifetime, sData.maxLifetime)
			end
		end
		mergedCount = mergedCount + 1
	end

	local saveOk = pcall(function()
		ensureFolder()
		local jsonText
		local encodeOk, encoded = pcall(serializeSkillData, existingData)
		if encodeOk and encoded and #encoded > 0 then
			jsonText = encoded
		else
			jsonText = HttpService:JSONEncode(existingData)
		end
		writefile(filePath, jsonText)
	end)

	if saveOk then
		-- Tự động nạp luôn vào bộ nhớ cho Mode 2
		skillTimingManager.LoadMapData(targetMapName)
		notifier.Notify("Skill Training", ("Đã lưu thành công %d chiêu thức vào map [%s]!"):format(mergedCount, targetMapName), 4)
		table.clear(recordedSessionData)
		recordedSkillCount = 0
		totalSamplesCount = 0
		fireChange()
		return true, mergedCount
	else
		notifier.Notify("Training Error", "Lỗi trong quá trình ghi file!", 3)
		return false, 0
	end
end

function skillTimingManager.ClearRecordedSession()
	table.clear(recordedSessionData)
	recordedSkillCount = 0
	totalSamplesCount = 0
	fireChange()
	notifier.Notify("Skill Training", "Đã xóa bộ nhớ đệm phiên huấn luyện.", 2)
end

-- In dữ liệu phiên huấn luyện (Buffer trong RAM) ra console F9
function skillTimingManager.PrintRecordedData()
	print("================ [SkillTiming] Recorded Session Buffer ================")
	local count = 0
	for name, data in pairs(recordedSessionData) do
		count = count + 1
		local tag = data.isProjectile and "🚀 Projectile" or "💥 AoE"
		print(string.format("[%d] '%s' [%s] | avgLife: %.2fs | hitDelay: %.2fs | hits: %d (min: %.2fs, max: %.2fs)",
			count, name, tag, data.avgLifetime or 0, data.avgHitDelay or 0, data.count or 1, data.minLifetime or 0, data.maxLifetime or 0))
	end
	if count == 0 then
		print("No skills recorded in current session buffer.")
	end
	print("=======================================================================")
	return count
end

-- In dữ liệu Map đã nạp vào RAM ra console F9
function skillTimingManager.PrintLoadedMapData()
	local mapName = selectedMap or shared.GetCurrentDungeonName() or "Unknown"
	print(string.format("================ [SkillTiming] Loaded RAM Data for [%s] ================", mapName))
	local count = 0
	for name, data in pairs(loadedTrainedData) do
		count = count + 1
		local tag = data.isProjectile and "🚀 Projectile" or "💥 AoE"
		print(string.format("[%d] '%s' [%s] | avgLife: %.2fs | hitDelay: %.2fs | hits: %d",
			count, name, tag, data.totalLifetime or 0, data.hitDelay or 0, data.count or 1))
	end
	if count == 0 then
		print("No trained skills loaded for this map.")
	end
	print("=======================================================================")
	return count
end

--// GETTERS & SETTERS
function skillTimingManager.SetMode(mode)
	if mode == "Default Preset" or mode == "Trained Preset" then
		currentMode = mode
		if currentMode == "Trained Preset" then
			skillTimingManager.LoadMapData(selectedMap)
		end
		fireChange()
	end
end

function skillTimingManager.GetMode()
	return currentMode
end

function skillTimingManager.SetSelectedMap(mapName)
	if mapName and #mapName > 0 then
		selectedMap = mapName
		if currentMode == "Trained Preset" then
			skillTimingManager.LoadMapData(selectedMap)
		end
		fireChange()
	end
end

function skillTimingManager.GetSelectedMap()
	if not selectedMap then
		selectedMap = shared.GetCurrentDungeonName()
		if not selectedMap or #selectedMap == 0 then
			local dList = dungeonCatalog.GetDungeons()
			selectedMap = (dList and dList[1]) or "Desert Temple"
		end
	end
	return selectedMap
end

function skillTimingManager.GetLoadedSkillCount()
	return loadedSkillCount
end

function skillTimingManager.GetRecordedSkillCount()
	return recordedSkillCount
end

function skillTimingManager.GetTotalSamplesCount()
	return totalSamplesCount
end

function skillTimingManager.GetDefaultPresets()
	return DEFAULT_PRESETS
end

function skillTimingManager.OnChanged(callback)
	if type(callback) == "function" then
		table.insert(changeListeners, callback)
	end
end

-- Tự động nhận diện map khi vào Dungeon mới
task.spawn(function()
	while true do
		local curDungeon = shared.GetCurrentDungeonName()
		if curDungeon and curDungeon ~= selectedMap and currentMode == "Trained Preset" then
			selectedMap = curDungeon
			skillTimingManager.LoadMapData(curDungeon)
		end
		task.wait(2.0)
	end
end)

return skillTimingManager
