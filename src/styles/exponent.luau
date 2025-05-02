local function exponentIn(alpha: number): number
    return if alpha == 0 then 0 else math.pow(2, 10 * alpha - 10)
end

local function exponentOut(alpha: number): number
    return if alpha == 1 then 1 else 1 - math.pow(2, -10 * alpha)
end

local function exponentInOut(alpha: number): number
    return if alpha == 0
        then 0
        elseif alpha == 1 then 1
        elseif alpha < 0.5 then math.pow(2, 20 * alpha - 10) / 2
        else (2 - math.pow(2, -20 * alpha + 10)) / 2
end

return {
    ['in'] = exponentIn,
    out = exponentOut,
    inOut = exponentInOut,
}
