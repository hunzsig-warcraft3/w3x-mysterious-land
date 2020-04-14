getBookPowLevel = function(curWave)
    curWave = curWave or 1
    local bpow = {1, 0, 0, 0}
    if (curWave <= 9) then
        bpow = {1, 0, 0, 0}
    elseif (curWave <= 15) then
        bpow = {5, 1, 0, 0}
    elseif (curWave <= 27) then
        bpow = {10, 6, 1, 0}
    elseif (curWave <= 45) then
        bpow = {5, 10, 1, 0}
    elseif (curWave <= 80) then
        bpow = {3, 10, 2, 0}
    elseif (curWave <= 130) then
        bpow = {0, 8, 1, 0}
    elseif (curWave <= 170) then
        bpow = {0, 8, 5, 1}
    elseif (curWave <= 210) then
        bpow = {0, 1, 5, 2}
    else
        bpow = {0, 0, 5, 1}
    end
    local tarBPows = {}
    for k, v in ipairs(bpow) do
        if (v > 0) then
            for i = 1, v, 1 do
                table.insert(tarBPows, k)
            end
        end
    end
    return tarBPows[math.random(1, #tarBPows)]
end

getTowerPowLevel = function(curWave)
    curWave = curWave or 1
    local tpow = {E = 1}
    if (curWave <= 3) then
        tpow = {E = 1}
    elseif (curWave <= 7) then
        tpow = {E = 7, D = 3}
    elseif (curWave <= 18) then
        tpow = {E = 4, D = 6, C = 1}
    elseif (curWave <= 26) then
        tpow = {E = 3, D = 6, C = 2, B = 1}
    elseif (curWave <= 41) then
        tpow = {D = 4, C = 6, B = 1}
    elseif (curWave <= 60) then
        tpow = {D = 6, C = 16, B = 4, A = 1}
    elseif (curWave <= 75) then
        tpow = {C = 10, B = 10, A = 1}
    elseif (curWave <= 85) then
        tpow = {C = 8, B = 27, A = 3}
    elseif (curWave <= 100) then
        tpow = {B = 25, A = 15, S = 1}
    elseif (curWave <= 130) then
        tpow = {B = 10, A = 25, S = 1}
    elseif (curWave <= 160) then
        tpow = {A = 30, S = 20, SS = 5}
    elseif (curWave <= 180) then
        tpow = {A = 5, S = 30, SS = 10}
    elseif (curWave <= 235) then
        tpow = {S = 30, SS = 10, SSS = 1}
    elseif (curWave <= 260) then
        tpow = {S = 5, SS = 10, SSS = 2}
    elseif (curWave <= 400) then
        tpow = {SS = 8, SSS = 1}
    else
        tpow = {SSS = 1}
    end
    local targetTPows = {}
    for k, v in pairs(tpow) do
        for i = 1, v, 1 do
            table.insert(targetTPows, k)
        end
    end
    return targetTPows[math.random(1, #targetTPows)]
end
