local function circularIn(alpha: number): number
    return 1 - math.sqrt(1 - math.pow(alpha, 2))
end

local function circularOut(alpha: number): number
    return math.sqrt(1 - math.pow(alpha - 1, 2))
end

local function circularInOut(alpha: number): number
    return if alpha < 0.5
        then (1 - math.sqrt(1 - math.pow(2 * alpha, 2))) / 2
        else (math.sqrt(1 - math.pow(-2 * alpha + 2, 2)) + 1) / 2
end

return {
    ['in'] = circularIn,
    out = circularOut,
    inOut = circularInOut,
}
