# Script Hub

> Read more about each specific project element in their respective folders.

1. [Installing dependencies](#installing-dependencies)
2. [Linting your code](#linting-your-code)
3. [Building your project](#building-your-project)

## Installing dependencies

### [Aftman](https://github.com/LPGhatguy/aftman)

Aftman is a toolchain manager. **It is required to install the dependencies below.**

1. Download and extract the [latest release](https://github.com/LPGhatguy/aftman/releases/latest)

2. Run the following command in command prompt/powershell:

```ps1
<path_to_aftman.exe> self-install
```

> Replace `<path_to_aftman.exe>` with the actual location of your aftman executable. </br> Example:
> ```ps1
> "C:\Tools\aftman.exe" self-install 
> ```

Now run:

```ps1
aftman install
```

Which installs all listed dependencies in [aftman.toml](./aftman.toml)

## Linting your code

Stylua will handle most of this for you, but they have their limits.

> The default keybind to run Stylua is **_`Shift + Alt + F`_**

### Naming

Naming conventions help make your code more readable and consistent. Common styles include:

- `camelCase`
- `Snake_Case`
- `PascalCase`

Whatever style you choose, **stick with it consistently**. It’s surprisingly easy to mix conventions without noticing.

> ❌ Don't

```luau
local Module = require("@core/module.luau")

local filename = "something.luau"

local function Make_File(name)
    print(`Made {name}!`)
end
```

> ✅ Do

```luau
local module = require("@core/module.luau")

local fileName = "something.luau"

local function makeFile(name)
    print(`Made {name}!`)
end
```

### Sections

Sectioning your code helps make it more readable and maintainable. There are many ways to do it, but this is the order I usually follow:

```luau
--// Imports
local module1 = require("@core/module1")
local module2 = require("@modules/module2")

--// Constants
local CONSTANT_1 = "Hello, World!" -- Use UPPER_SNAKE_CASE for constants
local CONSTANT_2 = 1234567890

--// Variables
local variable1 = 5
local variable2 = os.time()

--// Methods
local method1 = module1.Method1
local method2 = module2.Method2

--// Functions
local function foo1(bar1, bar2)
    return bar1 ^ bar2
end

local function foo2(bar1)
    return bar1 * 100
end

--// Initialize
variable1 = foo1(variable1, 2)
foo2(variable1)

print(variable1)
```

## Building your project

> This project uses the [ProCMP](https://github.com/Proton-Utilities/ProCMP) build composer, which lets you access build data during run-time, and use build configurations with special behavior as well as automatic release deployment to Github.

To build your project, use the default VS Code build keybind: **_`Ctrl + Shift + B`_**
> Optionally, you can use `lune run pipeline/build.luau pipeline/.pcmp.json` to manually run the build script.

1. After running the build script, you will be prompted with a CLI interface. Select your build config using the `↑` and `↓` arrows, and press `↵ ENTER` to select.

2. Based on your selected build and PCMP configuration, you may be prompted for a build version, it is recommended to use [Semantic versioning](https://semver.org/).

3. Based on your selected build and PCMP configuration, you may be asked if you want to publicly deploy this release, if you select yes, it will ask for release notes. Once you’ve completed the prompts, the release will be deployed to your repository.

### Setting up a PCMP configuration

The build system is powered by a `pipeline/.pcmp.json` configuration file, which controls how your project is composed, versioned, and optionally deployed.

Here’s an overview of the included build configs:

- **Debug**
A minimal local build with no versioning or deployment prompts. This uses a separate darklua configuration that is focused on making your code easily debuggable and still readable.

- **Beta**
A prerelease build that prompts for a version number and can optionally deploy the output to GitHub.

- **Release**
The final production build. Like Beta, it prompts for versioning and deployment but does not mark the version as a prerelease.

> By default, all builds are stored to `./generated`, it is recommended to blacklist this folder from your commits using a `.gitignore` file and instead use Github releases to deploy distribution files.

To enable GitHub deployment, you'll need to fill in your GitHub `apiKey` under the `deployment` section:

```json
"deployment": {
  "enabled": true,
  "github": {
    "apiKey": "ghp_abcdefghijklmnopqrstuvwxyz",
    "owner": "YourUsername",
    "repo": "YourRepository"
  }
}
```

> [!WARNING]  
> **NEVER** commit your actual API key to version control in public repositories. Either store it in a `.env` file or blacklist `.pcmp.json` entirely from your commits using a `.gitignore` file.

### Editing the frame

The [build frame](./pipeline/frame.luau) is essentially the insertion point for your actual build, it uses composer markers to insert build data, as well as the build itself into the final script.

`_P` is the table that you access in run-time, it holds all the build data. (You can change its name in the [frame](./pipeline/frame.luau) file)

`__COMPOSER` is a placeholder/marker for ProCMP to replace with build info.

By default, it also includes file data at the top, like the repo name and author, it is recommended to change this to your actual project info.

### Using run-time build data

At runtime, you can access the `_P` global to:

- Conditionally run code based on a specific config

```luau
if _P.cfg ~= "Release" then
    print("[DEBUG MODE] Extra logging enabled")
end
```

- Know what version of your script the user is running

```luau
local latestVersion = 6.2.1

if _P.vers ~= latestVersion then
    print(`You are running an out of date build! Latest: {latestVersion} Yours: {_P.vers}`)
end
```
