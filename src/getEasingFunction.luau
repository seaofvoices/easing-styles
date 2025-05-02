local back = require('./styles/back')
local bounce = require('./styles/bounce')
local circular = require('./styles/circular')
local cubic = require('./styles/cubic')
local elastic = require('./styles/elastic')
local exponent = require('./styles/exponent')
local linear = require('./styles/linear')
local quad = require('./styles/quad')
local quart = require('./styles/quart')
local quint = require('./styles/quint')
local sine = require('./styles/sine')

export type Direction = 'in' | 'out' | 'in-out'
export type Style =
    'linear'
    | 'sine'
    | 'quad'
    | 'cubic'
    | 'quart'
    | 'quint'
    | 'circular'
    | 'exponent'
    | 'back'
    | 'elastic'
    | 'bounce'

local STYLES = {
    linear = linear,
    back = back,
    bounce = bounce,
    circular = circular,
    circ = circular,
    cubic = cubic,
    elastic = elastic,
    exponent = exponent,
    exp = exponent,
    quad = quad,
    quart = quart,
    quint = quint,
    sine = sine,
    sin = sine,
}

local DIRECTION_MAPPINGS = {
    ['in-out'] = 'inOut',
    ['inout'] = 'inOut',
    ['in_out'] = 'inOut',
    ['in out'] = 'inOut',
}

local function getEasingFunction(style: Style, direction: Direction): (number) -> number
    if _G.DEV then
        if type(style) ~= 'string' then
            error(`invalid easing style of type '{type(style)}' provided`)
        end
        if type(direction) ~= 'string' then
            error(`invalid easing direction of type '{type(direction)}' provided`)
        end
    end

    local normalizedStyle = string.lower(style) :: Style
    local normalizedDirection = string.lower(direction) :: Direction

    local styleFns = STYLES[normalizedStyle]

    if styleFns == nil then
        error(`invalid easing style '{style}' provided`)
    end

    if DIRECTION_MAPPINGS[normalizedDirection] then
        normalizedDirection = DIRECTION_MAPPINGS[normalizedDirection]
    end

    local easingFn = styleFns[normalizedDirection]

    if easingFn == nil then
        error(`invalid easing direction '{direction}' provided`)
    end

    return easingFn
end

return getEasingFunction
