--[[package.cpath = package.cpath .. ';C:/Users/admin/AppData/Roaming/JetBrains/IdeaIC2022.2/plugins/EmmyLua/debugger/emmy/windows/x64/?.dll'
local dbg = require('emmy_core')
dbg.tcpConnect('localhost', 9966)]]

function permgen(a,n)
    n = n or #a
    if n<=1 then
        coroutine.yield(a)
    else
        for i = 1, n do
            a[n],a[i] = a[i],a[n]
            permgen(a,n-1)
            a[n],a[i]=a[i],a[n]
        end
    end
end

function permutations(a)
    --[[
    local co = coroutine.create(function()
        permgen(a)
    end)
    return function()
        local code,res = coroutine.resume(co)
        return res
    end]]
    return coroutine.wrap(function()
        permgen(a)
    end)
end

function printResult(a)
    print(table.unpack(a))
end

for p in permutations{"a","b","c"} do
    printResult(p)
end
