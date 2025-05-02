<div align="center">

[![checks](https://github.com/seaofvoices/easing-styles/actions/workflows/test.yml/badge.svg)](https://github.com/seaofvoices/easing-styles/actions/workflows/test.yml)
![version](https://img.shields.io/github/package-json/v/seaofvoices/easing-styles)
[![GitHub top language](https://img.shields.io/github/languages/top/seaofvoices/easing-styles)](https://github.com/luau-lang/luau)
![license](https://img.shields.io/npm/l/@seaofvoices/easing-styles)
![npm](https://img.shields.io/npm/dt/@seaofvoices/easing-styles)

[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/seaofvoices)

</div>

# easing-styles

A Luau library to interpolate values using common easing functions. It implements the easing function formulas from [easings.net](https://easings.net/).

Available styles: `linear`, `sine`, `quad`, `cubic`, `quart`, `quint`, `circular`, `exponent`, `back`, `elastic`, `bounce`.

## Installation

Add `@seaofvoices/easing-styles` in your dependencies:

```bash
yarn add @seaofvoices/easing-styles
```

Or if you are using `npm`:

```bash
npm install @seaofvoices/easing-styles
```

## Content

Easing styles and directions are best understood through visual animations. You can explore interactive visualizations at websites like [easings.net](https://easings.net/) to see how each style and direction affects the motion.

### getEasingFunction

```lua
function getEasingFunction(style: Style, direction: Direction): (number) -> number
```

Returns an easing function based on the specified style and direction.

#### Styles

| style name | description |
| - | - |
| `sine` (or `sin`) | Sinusoidal easing (gentle acceleration/deceleration) |
| `quad` | Quadratic easing (`x^2`) |
| `cubic` | Cubic easing (`x^3`) |
| `quart` | Quartic easing (`x^4`) |
| `quint` | Quintic easing (`x^5`) |
| `circular` (or `circ`) | Circular easing |
| `exponent` (or `exp`) | Exponential easing |
| `back` | Back easing (overshoots target and comes back) |
| `elastic` | Elastic easing (spring-like effect) |
| `bounce` | Bounce easing (bounces at the end) |
| `linear` | Linear interpolation (no easing) |

#### Directions

Each easing style can be applied with different direction.

| direction | description |
| - | - |
| `in` | The easing function is applied as the animation progresses **from start to target**. Generally, the effect is more pronounced at the end of the animation. |
| `out` | The easing function is applied as the animation progresses **from target back to start**. The effect is more pronounced at the beginning of the animation. |
| `in-out`|  The easing function is applied at both the beginning and end of the animation. |

#### Usage Example

```lua
local easingStyles = require('@pkg/@seaofvoices/easing-styles')
local cubicFn = easingStyles.getEasingFunction('cubic', 'out')

-- Use the easing function with a value between 0 and 1
local result = cubicFn(0.5)
```

#### chain

```lua
function chain(easingFunctions: { (number) -> number }): (number) -> number
```

Chains multiple easing functions together, transitioning from one to another. For example, with two functions, the first will handle inputs from 0 to 0.5, and the second will handle inputs from 0.5 to 1.0.

This function will throw an error if the `easingFunctions` list is empty.

#### Usage Example

```lua
local easingStyles = require('@pkg/@seaofvoices/easing-styles')

local chainedEasing = easingStyles.chain({
    easingStyles.getEasingFunction('sine', 'in'),
    easingStyles.getEasingFunction('bounce', 'out')
})

-- Use the chained easing function
local result = chainedEasing(0.7)
```

## Releases

Versions of this project are also pre-built and linked to [GitHub releases](https://github.com/seaofvoices/luau-disk/releases):

- `easing-styles.rbxm` is a Roblox model file
- `easing-styles.luau` is a single-file version of the library (with Luau type annotations removed)

## Other Lua Environments Support

If you would like to use this library on a Lua environment, where it is currently incompatible, open an issue (or comment on an existing one) to request the appropriate modifications.

The library uses [darklua](https://github.com/seaofvoices/darklua) to process its code.

## License

This project is available under the MIT license. See [LICENSE.txt](LICENSE.txt) for details.
