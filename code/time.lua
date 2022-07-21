
--双端队列
function listNew()
    return {first = 0,last = -1}
end

function pushFirst(list,value)
    local first = list.first -1
    list.first = first
    list[first] = value
end

function pushLast(list,value)
    local last = list.last + 1
    list.last = last
    list[last] = value
end

function popFirst(list)
    local first = list.first
    if(first>list.last) then
        error("list is empty")
    end
    local value = list[first]
    list[first] = nil
    list.first = first+1
    return value
end

function popLast(list)
    local last = list.last
    if(list.first>last) then
        error("list is empty")
    end
    local value = list[last]
    list[last] = nil
    list.last = last+1
    return value
end

local ln = listNew()
pushFirst(ln,123)
pushFirst(ln,456)
pushFirst(ln,789)

for i, v in pairs(ln) do
    print(i,v)
end


--[[local mt = {}
for i = 1, 3 do
    local aux = (i-1)*3
    for j = 1, 3 do
        mt[aux+j]=0
    end
end
for i, v in pairs(mt) do
    print(i,v)
end]]

--[[local s = string.pack(">s1","hello")
print(#s)
for i = 1, #s do
    print(string.unpack("B",s,i))
end]]


--[[local s = "hello\0lua\0world\0"
local i = 0
while i<=#s do
    local res
    res,i = string.unpack("z",s,i)
    print(res)
end]]


--[[print(os.time())

local t = os.date("*t",os.time())
for i, v in pairs(t) do
    print(i,v)
end]]

