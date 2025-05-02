local function bounceIn(alpha: number): number
    local a = 1 - alpha
    local n1 = 7.5625
    local d1 = 2.75

    if a < 1 / d1 then
        return 1 - n1 * a * a
    elseif a < 2 / d1 then
        a -= 1.5 / d1
        return 1 - n1 * a * a - 0.75
    elseif a < 2.5 / d1 then
        a -= 2.25 / d1
        return 1 - n1 * a * a - 0.9375
    else
        a -= 2.625 / d1
        return 1 - n1 * a * a - 0.984375
    end
end

local function bounceOut(alpha: number): number
    local n1 = 7.5625
    local d1 = 2.75

    if alpha < 1 / d1 then
        return n1 * alpha * alpha
    elseif alpha < 2 / d1 then
        alpha -= 1.5 / d1
        return n1 * alpha * alpha + 0.75
    elseif alpha < 2.5 / d1 then
        alpha -= 2.25 / d1
        return n1 * alpha * alpha + 0.9375
    else
        alpha -= 2.625 / d1
        return n1 * alpha * alpha + 0.984375
    end
end

local function bounceInOut(alpha: number): number
    return if alpha < 0.5
        then (1 - bounceOut(1 - 2 * alpha)) / 2
        else (1 + bounceOut(2 * alpha - 1)) / 2
end

return {
    ['in'] = bounceIn,
    out = bounceOut,
    inOut = bounceInOut,
}
