local function cubicIn(alpha: number): number
    return alpha * alpha * alpha
end

local function cubicOut(alpha: number): number
    return 1 - math.pow(1 - alpha, 3)
end

local function cubicInOut(alpha: number): number
    return if alpha < 0.5 then 4 * alpha * alpha * alpha else 1 - math.pow(-2 * alpha + 2, 3) / 2
end

return {
    ['in'] = cubicIn,
    out = cubicOut,
    inOut = cubicInOut,
}
