
--统计单词出现次数
local counter = {}

for line in io.lines() do
    for word in string.gmatch(line,"%w+") do
        counter[word] = (counter[word] or 0) + 1
    end
end

local words = {}
for w in pairs(counter) do
    words[#words+1] = w
end
table.sort(words,function(a, b)
    return counter[a] > counter[b] or counter[a] == counter[b] and a<b
end)

local n = math.min(tonumber(arg[1]) or math.huge,#words)

for i = 1, n do
    print(words[i],counter[words[i]])
end

--百分号是转义符,[...]表示字符集,^代表补字符


--[[string.gmatch 返回一个函数,通过返回的函数可以遍历一个字符串中所有出现的指定模式
--‘%a+’ 会匹配一个或多个字母组成的序列（单词）
s = "so1me-str2ing-x3x-b4b"

--符号分隔
local split = function(str,p)
    local words = {}
    for w in string.gmatch(str,"%w+%"..p.."?") do
        words[#words+1] = string.gsub(w,p,"",1)
    end
    return words
end

local w = split(s,"-")

for i = 1, #w do
    print(w[i])
end]]


--string.gsub(目标字符串、模式、替换字符串,替换次数)   返回 替换后的字符串和发生替换的次数
--[[s = string.gsub("xx is aa","aa","bb")
print(s)
s = string.gsub("all lii","l","x")
print(s)
s = string.gsub("xx is aa","bb","cc")
print(s)]]

--[[date = "today is 28/6/2022"
d = string.match(date,"%d+/%d+/%d+")
print(d)]]


--[[s = "hello world"
i,j = string.find(s,"hello")
print(i,j)
print(string.sub(s,i,j))
print(string.find(s,"world"))
i,j = string.find(s,"l")
print(i,j)]]