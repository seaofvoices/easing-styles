local chain = require('./chain')
local getEasingFunction = require('./getEasingFunction')

export type Direction = getEasingFunction.Direction
export type Style = getEasingFunction.Style

return {
    chain = chain,
    getEasingFunction = getEasingFunction,
}
