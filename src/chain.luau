local function chain(easingFns: { (number) -> number }): (number) -> number
    local total = #easingFns

    if total == 0 then
        error(`unable to chain easing functions: empty easing function list`)
    elseif total == 1 then
        return easingFns[1]
    end

    local lastEasing = easingFns[total]

    local function chained(alpha: number): number
        local multiplied = alpha * total
        local index = 1 + math.floor(multiplied)
        local currentEasing = easingFns[index] or lastEasing
        return currentEasing(multiplied % 1)
    end

    return chained
end

return chain
