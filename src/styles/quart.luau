local function quartIn(alpha: number): number
    return alpha * alpha * alpha * alpha
end

local function quartOut(alpha: number): number
    return 1 - math.pow(1 - alpha, 4)
end

local function quartInOut(alpha: number): number
    return if alpha < 0.5
        then 8 * alpha * alpha * alpha * alpha
        else 1 - math.pow(-2 * alpha + 2, 4) / 2
end

return {
    ['in'] = quartIn,
    out = quartOut,
    inOut = quartInOut,
}
