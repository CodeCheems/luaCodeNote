--一个用于集合的简单模块

local Set = {}
local mt = {}
function Set.new(l)
    local set = {}
    setmetatable(set,mt)
    for i, v in ipairs(l) do
        set[v] = true
    end
    return set
end

function Set.union(a,b)
    local res = Set.new{}
    for k in pairs(a) do
        res[k] = true
    end
    for k in pairs(b) do
        res[k] = true
    end
    return res
end

function Set.intersection(a,b)
    local res = Set.new{}
    for k in pairs(a) do
        res[k] = b[k]
    end
    return res
end

function Set.tostring(set)
    local l = {}
    for e in pairs(set) do
        l[#l+1] = tostring(e)
    end
    return "{"..table.concat(l,", ").."}"
end

mt.__add = Set.union
mt.__mul = Set.intersection
mt.__tostring = Set.tostring
--[[s1 = Set.new{10,20,30,50}
s2 = Set.new{30,1}
s3 = s1+s2
print(Set.tostring((s1+s2)*s1))
print(Set.tostring(s3))
]]



--return Set