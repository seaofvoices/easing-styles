local function backIn(alpha: number): number
    local c1 = 1.70158
    local c3 = c1 + 1

    return c3 * alpha * alpha * alpha - c1 * alpha * alpha
end

local function backOut(alpha: number): number
    local c1 = 1.70158
    local c3 = c1 + 1

    return 1 + c3 * math.pow(alpha - 1, 3) + c1 * math.pow(alpha - 1, 2)
end

local function backInOut(alpha: number): number
    local c1 = 1.70158
    local c2 = c1 * 1.525

    return if alpha < 0.5
        then (math.pow(2 * alpha, 2) * ((c2 + 1) * 2 * alpha - c2)) / 2
        else (math.pow(2 * alpha - 2, 2) * ((c2 + 1) * (alpha * 2 - 2) + c2) + 2) / 2
end

return {
    ['in'] = backIn,
    out = backOut,
    inOut = backInOut,
}
