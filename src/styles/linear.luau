local function linear(alpha: number): number
    return alpha
end

return {
    ['in'] = linear,
    out = linear,
    inOut = linear,
}
