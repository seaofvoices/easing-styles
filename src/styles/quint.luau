local function quintIn(alpha: number): number
    return alpha * alpha * alpha * alpha * alpha
end

local function quintOut(alpha: number): number
    return 1 - math.pow(1 - alpha, 5)
end

local function quintInOut(alpha: number): number
    return if alpha < 0.5
        then 16 * alpha * alpha * alpha * alpha * alpha
        else 1 - math.pow(-2 * alpha + 2, 5) / 2
end

return {
    ['in'] = quintIn,
    out = quintOut,
    inOut = quintInOut,
}
