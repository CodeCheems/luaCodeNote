--Single-method Object

function newObject(value)
    return function(action,v)
        if action == "get" then return value
            elseif action=="set" then value = v
            else error("invalid action")
        end
    end
end

d = newObject(0)
print(d("get"))
d("set",10)
print(d("get"))

--Memorize Function
local results={}
setmetatable(results,{__mode="kv"})
function mem_loadstring(s)
    local res = results[s]
    if res==nil then
        res = assert(load(s))
        results[s] = res
    end
    return res
end

local metas = {}
setmetatable(metas,{__mode="v"})
function setDefault(t,d)
    local mt = metas[d]
    if mt == nil then
        mt = {__index = function()
            return d
        end}
        metas[d]=mt
    end
    setmetatable(t,mt)
end
