
--[[prototype = {
    x=0,
    y=0,
    width=100,
    height = 100,
}
local mt = {}
function new(o)
    setmetatable(o,mt)
    return o
end
mt.__index = function(_,key)
    return prototype[key]
end

w = new{x=10,y=20}
print(w.width)]]

--[[function setDefault(t,d)
    local mt = {__index = function() return d end}
    setmetatable(t,mt)
end

tab = {x=10,y=20}
print(tab.x,tab.z)
setDefault(tab,0)
print(tab.x,tab.z)]]

function track(t)
    local proxy = {}
    local mt = {
        __index = function(_,k)
            print("*access to element "..tostring(k))
            return t[k]
        end,
        __newindex = function(_,k,v)
            print("*update of element "..tostring(k).." to "..tostring(v))
            t[k] = v
        end,
        __pairs = function()
            return function(_,k)
                local nextkey,nextvalue = next(t,k)
                if nextkey~=nil then
                    print("*traversing element "..tostring(nextkey))
                end
                return nextkey,nextvalue
            end
        end,
        __len = function() return #t end
    }
    setmetatable(proxy,mt)
    return proxy
end

t={}
t=track(t)
t[2]="hello"
print(t[2])

y=track({10,20})
print(#y)
for i, v in pairs(y) do
    print(i,v)
end