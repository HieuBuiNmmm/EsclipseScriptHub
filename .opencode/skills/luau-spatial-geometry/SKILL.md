---

name: luau-spatial-geometry
description: Expert spatial geometry and spatial algorithms for Roblox Luau. Use when implementing, reviewing, debugging, optimizing, or refactoring 2D/3D spatial logic involving Vector3, CFrame, rays, planes, AABB/OBB, FOV, line-of-sight, visibility, spatial queries, spatial partitioning, reachability, movement cost, danger zones, room detection, nearest-neighbor queries, collision/intersection tests, or target selection.

----------------------------------------------------------------------------

# Luau Spatial Geometry

You are an expert in computational geometry, 3D spatial algorithms, and
Roblox Luau spatial programming.

Your job is not merely to produce working code.

You must reason about:

1. Geometric correctness
2. Coordinate spaces
3. Numerical stability
4. Algorithmic complexity
5. Roblox engine/API costs
6. Data scale
7. Update frequency
8. Separation between broad-phase and narrow-phase tests

Prefer simple, deterministic, testable algorithms over unnecessary complexity.

---

# 1. Core Principles

## 1.1 Always identify the spatial problem first

Before writing code, classify the problem:

* Point query
* Distance query
* Direction query
* Angular query
* Ray query
* Segment query
* Plane query
* Volume query
* Intersection test
* Visibility test
* Reachability test
* Nearest-neighbor query
* Spatial partition query
* Path cost calculation

Do not immediately reach for Raycast.

---

# 2. Coordinate Space

Always determine which coordinate space is being used:

* World space
* Object/local space
* Camera space
* Character space
* Room space

For Roblox:

* `Vector3` values are normally world-space positions unless explicitly transformed.
* `CFrame` defines position and orientation.
* `CFrame:PointToObjectSpace()` converts a world point into local/object space.
* `CFrame:PointToWorldSpace()` converts local/object coordinates to world space.
* `CFrame:VectorToObjectSpace()` converts directions into local space.
* `CFrame:VectorToWorldSpace()` converts directions into world space.

Never compare vectors from different coordinate spaces without conversion.

---

# 3. Vector Mathematics

Use vector mathematics deliberately.

## Distance

Prefer squared distance when only comparison is required:

```lua
local delta = a - b
local distanceSquared = delta:Dot(delta)
```

Avoid `Magnitude` when no actual distance value is needed.

Use:

```lua
distanceSquared <= radius * radius
```

instead of:

```lua
(a - b).Magnitude <= radius
```

when performance matters.

## Direction

```lua
local direction = target - origin
local distance = direction.Magnitude

if distance > 0 then
    direction = direction / distance
end
```

Do not normalize zero-length vectors.

## Dot Product

Use dot product for:

* front/behind tests
* FOV
* angle comparisons
* directional similarity
* projection

Example:

```lua
local dot = forward:Dot(direction)
```

For normalized vectors:

```text
dot > 0      → same hemisphere
dot = 1      → same direction
dot = 0      → perpendicular
dot < 0      → opposite hemisphere
```

For FOV:

```lua
dot >= math.cos(math.rad(fovDegrees * 0.5))
```

Prefer the dot-product threshold over repeatedly calling `acos`.

## Cross Product

Use cross product for:

* orientation
* perpendicular vectors
* triangle normals
* sidedness
* 3D geometric relationships

Do not use cross product when dot product is sufficient.

---

# 4. Distance

Distinguish:

### Euclidean distance

```text
distance(A, B)
```

Straight-line distance.

### Horizontal distance

Ignore Y:

```lua
local delta = a - b
local horizontal = Vector3.new(delta.X, 0, delta.Z)
```

### Path distance

Actual traversable distance.

Never substitute Euclidean distance for path distance when obstacles
meaningfully affect movement.

For target selection:

```text
candidate filtering
    ↓
cheap Euclidean distance
    ↓
reachability/path query
    ↓
actual movement cost
```

---

# 5. Rays, Segments, and Lines

Know the distinction:

* Line = infinite in both directions
* Ray = origin + positive direction
* Segment = finite endpoints

Roblox `workspace:Raycast()` is a ray query.

Do not describe a Raycast as a generic line intersection.

---

# 6. Raycasting

Use Raycast for:

* line of sight
* obstruction testing
* visibility
* ground checks
* obstacle detection

Use appropriate `RaycastParams`.

Always consider:

* collision groups
* filtering
* water
* ignored instances
* origin offset
* target position
* obstruction semantics

For LOS:

```text
Origin
   │
   └──────────────► Target
          Raycast
```

Do not use a single ray from feet position when the gameplay meaning is
visibility of a character. Consider meaningful target points such as:

* head
* torso
* center
* multiple sample points when necessary

Do not automatically use multiple rays. Only use them when gameplay
requirements justify the cost.

---

# 7. Field of View

FOV should normally be evaluated in this order:

```text
1. Candidate exists
2. Distance filter
3. Direction calculation
4. Dot-product FOV test
5. LOS Raycast
```

Do not Raycast every object before checking whether it is even inside FOV.

For half-angle FOV:

```lua
local threshold = math.cos(math.rad(fovDegrees * 0.5))

local direction = (targetPosition - origin)

if direction.Magnitude > 0 then
    direction = direction.Unit

    local dot = forward:Dot(direction)

    if dot >= threshold then
        -- inside FOV
    end
end
```

---

# 8. Axis-Aligned Bounding Box (AABB)

AABB is aligned with world axes.

Represent it conceptually as:

```text
min
max
```

or:

```text
center
halfExtents
```

Use AABB for:

* cheap broad-phase filtering
* room bounds
* region queries
* simple volume tests
* spatial partitioning

AABB tests are usually cheaper than OBB tests.

---

# 9. Oriented Bounding Box (OBB)

OBB has its own orientation.

Use OBB when rotation matters.

A useful Roblox technique is:

```text
World point
    ↓
CFrame:PointToObjectSpace()
    ↓
local-space point
    ↓
compare against half-extents
```

This avoids unnecessarily complex world-space geometry.

For a box:

```lua
local localPoint = boxCFrame:PointToObjectSpace(point)

local inside =
    math.abs(localPoint.X) <= halfSize.X
    and math.abs(localPoint.Y) <= halfSize.Y
    and math.abs(localPoint.Z) <= halfSize.Z
```

---

# 10. Sphere Tests

Sphere tests are useful for:

* proximity
* detection radius
* threat radius
* explosion radius
* influence zones
* candidate filtering

Prefer squared distance comparisons.

---

# 11. Capsule / Character Approximation

When representing characters spatially, consider whether a point,
sphere, capsule, AABB, or OBB is appropriate.

Do not assume a character is a single point if collision/visibility
accuracy matters.

Use the cheapest representation that satisfies the gameplay requirement.

---

# 12. Intersection Tests

Know the difference between:

* point containment
* intersection
* overlap
* touching
* separation

Relevant tests include:

```text
Point ↔ Sphere
Point ↔ AABB
Point ↔ OBB
Sphere ↔ Sphere
Sphere ↔ AABB
AABB ↔ AABB
Ray ↔ Plane
Ray ↔ Sphere
Ray ↔ AABB
Segment ↔ AABB
```

Avoid implementing complicated intersection mathematics when an equivalent
Roblox engine query is simpler and sufficiently accurate.

---

# 13. Roblox Spatial Queries

Know when to use:

```lua
workspace:Raycast()
workspace:GetPartBoundsInBox()
workspace:GetPartBoundsInRadius()
workspace:GetPartsInPart()
```

General strategy:

```text
Raycast
→ directional query

GetPartBoundsInRadius
→ spherical broad-phase query

GetPartBoundsInBox
→ box broad-phase query

GetPartsInPart
→ overlap query using actual part geometry
```

Prefer broad-phase queries first when many objects must be considered.

---

# 14. Broad Phase / Narrow Phase

This is a mandatory design principle.

## Broad phase

Cheaply eliminate impossible candidates.

Examples:

```text
room membership
distance
AABB
sphere
spatial grid
spatial hash
octree
```

## Narrow phase

Perform expensive accurate checks.

Examples:

```text
LOS Raycast
OBB test
precise intersection
pathfinding
multi-point visibility
```

Preferred pipeline:

```text
All objects
    ↓
Spatial partition
    ↓
Distance/radius
    ↓
AABB/OBB/FOV
    ↓
LOS
    ↓
Reachability
    ↓
Final evaluation
```

Never perform expensive narrow-phase tests on every object unless
the dataset is demonstrably small.

---

# 15. Spatial Partitioning

Choose a spatial structure based on the data.

## Uniform Grid

Good when:

* world is relatively uniform
* objects are distributed reasonably evenly
* query radius is predictable
* implementation simplicity is important

## Spatial Hash

Good for:

* dynamic objects
* large sparse worlds
* fast insertion/removal
* proximity queries

## Quadtree

Use mainly for 2D spatial subdivision.

## Octree

Useful for:

* 3D spatial subdivision
* sparse worlds
* hierarchical spatial queries

## BVH

Useful when:

* hierarchical bounds are beneficial
* objects are relatively static
* many intersection queries are required

Do not introduce an octree/BVH merely because it sounds more advanced.

Measure or reason about whether the current scale requires it.

---

# 16. Nearest Neighbor

For a small number of candidates:

```text
O(n) scan
```

is often preferable.

For large/dynamic datasets:

```text
spatial hash
grid
octree
k-d tree
```

may be appropriate.

Do not build a complex nearest-neighbor structure for dozens of objects.

---

# 17. Room Detection

When determining whether an entity belongs to a room:

Prefer:

```text
Room broad bounds
    ↓
cheap containment
    ↓
optional precise test
```

If rooms are rectangular and axis-aligned, use AABB.

If rooms are rotated, use room-local coordinates through `CFrame`.

Do not repeatedly scan every descendant of every room if room membership
can be cached or spatially indexed.

---

# 18. Danger Zones

A danger zone should have an explicit geometric definition.

Possible representations:

```text
Sphere
Cylinder
AABB
OBB
Polygon
Union of volumes
Distance field
Influence map
```

Do not use the term "danger zone" without defining its geometry.

Example:

```text
Enemy
   ↓
Threat radius
   ↓
Sphere
   ↓
candidate points inside sphere
```

For multiple enemies:

```text
Enemy A ──► Zone A
Enemy B ──► Zone B
Enemy C ──► Zone C

Zone union
    ↓
Danger field
```

Consider whether zones should:

* overlap
* merge
* stack their danger values
* use maximum danger
* use additive danger
* decay with distance

---

# 19. Visibility / Line of Sight

Separate:

```text
Geometric visibility
```

from:

```text
Gameplay visibility
```

Gameplay visibility may include:

* FOV
* distance
* occlusion
* target type
* team
* state
* stealth
* height
* cover

Recommended:

```text
candidate
  ↓
distance
  ↓
FOV
  ↓
LOS
  ↓
gameplay rules
```

---

# 20. Reachability

Visibility does NOT imply reachability.

```text
LOS = can see target
Reachability = can navigate to target
```

These are separate questions.

Use:

```text
LOS
```

for visibility.

Use:

```text
Pathfinding / navigation graph / movement simulation
```

for reachability.

---

# 21. Movement Cost

Never automatically use:

```text
distance = movement cost
```

unless the world is obstacle-free and movement cost is defined that way.

Possible cost:

```text
Cost =
    path length
    + terrain penalty
    + obstacle penalty
    + danger penalty
    + turn penalty
    + movement-mode penalty
```

Example:

```text
Target A
    path = 20
    danger = 5

Target B
    path = 25
    danger = 0

Depending on weights:
A may be worse than B.
```

Keep the cost function explicit.

---

# 22. Target Selection

Use staged evaluation.

Preferred:

```text
All targets
    ↓
validity filter
    ↓
room filter
    ↓
distance filter
    ↓
FOV / LOS
    ↓
reachability
    ↓
movement cost
    ↓
score
    ↓
minimum/maximum selection
```

Do not run expensive pathfinding for targets that already fail cheap tests.

---

# 23. Numerical Stability

Always consider:

* zero-length vectors
* floating-point tolerance
* nearly parallel vectors
* boundary conditions
* points exactly on surfaces
* very small distances
* normalized vectors

Use an explicit epsilon when appropriate.

Do not use arbitrary epsilons without understanding their scale.

---

# 24. Complexity

When proposing an algorithm, state approximate complexity when useful.

Examples:

```text
Linear scan:
O(n)

Grid query:
approximately O(k) after indexing

Pairwise collision:
O(n²)

Spatial partition:
typically reduces candidate checks significantly
```

Always consider:

```text
N = number of objects
F = update frequency
Q = number of spatial queries
```

A cheap algorithm executed 60 times per second can still be expensive.

---

# 25. Update Frequency

Separate spatial logic by update frequency.

Example:

```text
Static room bounds
→ compute once

Enemy spatial registration
→ event-driven

Enemy list
→ periodic

FOV
→ periodic

LOS
→ less frequently or on demand

Pathfinding
→ only when target/path changes
```

Avoid full-world recomputation every frame unless justified.

---

# 26. Caching

Cache stable or reusable data:

```text
room bounds
room CFrame
enemy references
spatial cell
FOV cosine threshold
target metadata
path results
```

Invalidate caches when their underlying data changes.

Do not cache values whose cost of recomputation is lower than cache
maintenance.

---

# 27. Event-Driven vs Polling

Prefer event-driven updates for:

```text
object added
object removed
room changed
enemy spawned
enemy destroyed
```

Use polling/periodic scans when:

```text
position changes continuously
visibility changes
dynamic spatial relationships change
```

Do not make every system event-driven if the underlying property changes
continuously.

---

# 28. Roblox Performance Rules

Be careful with:

```text
GetDescendants()
GetChildren()
GetPartsInPart()
large Raycast loops
large table allocations
per-frame pathfinding
per-frame sorting
repeated CFrame conversions
```

Prefer:

```text
cached references
spatial filtering
squared distance
dot-product thresholds
reusable tables
event-driven registration
periodic updates
```

When optimizing, preserve correctness first.

---

# 29. Algorithm Selection Rules

Use this decision process:

```text
What am I querying?
        ↓
How many objects?
        ↓
How often?
        ↓
Static or dynamic?
        ↓
2D or 3D?
        ↓
Accuracy required?
        ↓
Roblox API already provides it?
        ↓
Choose simplest sufficient algorithm
```

Do not choose an algorithm based only on theoretical sophistication.

---

# 30. Architecture

Spatial logic should be separated from gameplay decisions.

Prefer:

```text
SpatialQuery
    ↓
Geometry
    ↓
Visibility
    ↓
Reachability
    ↓
Cost
    ↓
Decision
```

Avoid:

```text
EnemyManager
    └── 1000 lines of geometry + pathfinding + target selection
```

Recommended modules may include:

```text
SpatialQuery
GeometryUtils
BoundsUtils
VisibilityQuery
FOVQuery
RoomQuery
DangerZoneQuery
ReachabilityQuery
MovementCost
TargetEvaluator
```

Use project-specific names when existing architecture already defines them.

---

# 31. Refactoring Existing Spatial Systems

When reviewing an existing system:

1. Identify all spatial responsibilities.
2. Separate pure geometry from Roblox API calls.
3. Separate queries from decisions.
4. Identify repeated calculations.
5. Identify unnecessary scans.
6. Identify incorrect coordinate-space assumptions.
7. Identify expensive operations.
8. Preserve existing behavior unless a bug is proven.
9. Refactor incrementally.
10. Validate edge cases after each change.

Do not rewrite an entire spatial system merely to make it "cleaner."

---

# 32. Required Reasoning Format

For non-trivial spatial problems, reason in this order:

```text
Problem
↓
Geometric model
↓
Coordinate space
↓
Candidate set
↓
Broad phase
↓
Narrow phase
↓
Algorithm
↓
Complexity
↓
Roblox API cost
↓
Edge cases
↓
Implementation
```

If the user asks for code, provide the implementation after establishing
the correct model.

---

# 33. Anti-Patterns

Avoid:

* Raycasting everything
* Using Magnitude everywhere
* Calling `acos` for FOV unnecessarily
* Using Euclidean distance as path cost
* Confusing LOS with reachability
* Mixing world/local coordinates
* Rebuilding spatial indexes every frame
* Running pathfinding every frame
* Using OBB when AABB is sufficient
* Using octrees for tiny datasets
* Performing pairwise O(n²) checks without justification
* Creating large temporary tables in hot loops
* Overengineering simple geometry
* Hiding geometry logic inside unrelated gameplay modules

---

# 34. Output Expectations

When solving a spatial problem, prefer to explain:

```text
1. What geometric question is being asked?
2. What representation is appropriate?
3. What is the cheapest valid first filter?
4. What expensive test comes afterward?
5. Why this algorithm?
6. What is its complexity?
7. What Roblox API is appropriate?
8. What edge cases exist?
```

For optimization tasks, explicitly identify:

```text
Before
→ cost / complexity / frequency

After
→ cost / complexity / frequency

Why it is safe
→ behavioral equivalence
```

The goal is robust spatial reasoning, not merely code generation.
