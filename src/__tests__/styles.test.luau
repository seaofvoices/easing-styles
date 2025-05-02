local jestGlobals = require('@pkg/@jsdotlua/jest-globals')

local back = require('../styles/back')
local bounce = require('../styles/bounce')
local circular = require('../styles/circular')
local cubic = require('../styles/cubic')
local elastic = require('../styles/elastic')
local exponent = require('../styles/exponent')
local linear = require('../styles/linear')
local quad = require('../styles/quad')
local quart = require('../styles/quart')
local quint = require('../styles/quint')
local sine = require('../styles/sine')

local expect = jestGlobals.expect
local it = jestGlobals.it
local describe = jestGlobals.describe

type StyleInterface = {
    ['in']: (alpha: number) -> number,
    out: (alpha: number) -> number,
    inOut: (alpha: number) -> number,
}

local STYLES: { [string]: StyleInterface } = {
    back = back,
    bounce = bounce,
    circular = circular,
    cubic = cubic,
    elastic = elastic,
    exponent = exponent,
    linear = linear,
    quad = quad,
    quart = quart,
    quint = quint,
    sine = sine,
}

local directions = { 'in', 'out', 'inOut' }

for style, styleTable in STYLES do
    describe(`style: ${style}`, function()
        for _, direction in directions do
            it(`starts at 0 for "{direction}" direction`, function()
                expect(styleTable[direction](0)).toBeCloseTo(0)
            end)

            it(`ends at 1 for "{direction}" direction`, function()
                expect(styleTable[direction](1)).toBeCloseTo(1)
            end)
        end
    end)
end
