local function sineIn(alpha: number): number
    return 1 - math.cos((alpha * math.pi) / 2)
end

local function sineOut(alpha: number): number
    return math.sin((alpha * math.pi) / 2)
end

local function sineInOut(alpha: number): number
    return -(math.cos(math.pi * alpha) - 1) / 2
end

return {
    ['in'] = sineIn,
    out = sineOut,
    inOut = sineInOut,
}
