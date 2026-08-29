# `generated/`

This folder includes executable builds of your source.

- [Debug](./debug.luau)
- [Beta](./beta.luau)
- [Release](./release.luau)

If you look at [Debug](./debug.luau), you will notice it's more readable and not very "minified" like [Release](./release.luau) or [Beta](./beta.luau) is. This is intentional, it helps you debug a built file by retaining structures and lines, preserving stack traces.

---

It is recommended to exclude this entire folder in your final commit using a `.gitignore` file in the root of your project, and instead use **Github releases** (ProCMP automatically handles Github release deployment)
