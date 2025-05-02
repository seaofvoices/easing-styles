local function quadIn(alpha: number): number
    return alpha * alpha
end

local function quadOut(alpha: number): number
    local flipped = 1 - alpha
    return 1 - flipped * flipped
end

local function quadInOut(alpha: number): number
    return if alpha < 0.5 then 2 * alpha * alpha else 1 - math.pow(-2 * alpha + 2, 2) / 2
end

return {
    ['in'] = quadIn,
    out = quadOut,
    inOut = quadInOut,
}
