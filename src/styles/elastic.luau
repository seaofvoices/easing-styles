local function elasticIn(alpha: number): number
    local c4 = (2 * math.pi) / 3

    return if alpha == 0
        then 0
        elseif alpha == 1 then 1
        else -math.pow(2, 10 * alpha - 10) * math.sin((alpha * 10 - 10.75) * c4)
end

local function elasticOut(alpha: number): number
    local c4 = (2 * math.pi) / 3

    return if alpha == 0
        then 0
        elseif alpha == 1 then 1
        else math.pow(2, -10 * alpha) * math.sin((alpha * 10 - 0.75) * c4) + 1
end

local function elasticInOut(alpha: number): number
    local c5 = (2 * math.pi) / 4.5

    return if alpha == 0
        then 0
        elseif alpha == 1 then 1
        elseif alpha < 0.5 then -(math.pow(2, 20 * alpha - 10) * math.sin(
            (20 * alpha - 11.125) * c5
        )) / 2
        else (math.pow(2, -20 * alpha + 10) * math.sin((20 * alpha - 11.125) * c5)) / 2 + 1
end

return {
    ['in'] = elasticIn,
    out = elasticOut,
    inOut = elasticInOut,
}
