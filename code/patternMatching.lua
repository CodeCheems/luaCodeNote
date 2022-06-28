
--string.gmatch 返回一个函数,通过返回的函数可以遍历一个字符串中所有出现的指定模式
--‘%a+’ 会匹配一个或多个字母组成的序列（单词）
s = "some string xx bb"
words = {}
for w in string.gmatch(s,"%a+") do
    words[#words+1] = w
end
for i = 1, #words do
    print(words[i])
end


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