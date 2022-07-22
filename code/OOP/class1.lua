
--冒号语法糖，在方法调用中增加一个额外的实参,或在方法的定义中增加一个额外的隐藏形参
Account = {
    balance = 0,
    withdraw = function(self,v)
        if v>self.balance then
            error"insufficient funds"
        end
        self.balance = self.balance-v
    end
}
function Account:deposit(v)
    self.balance = self.balance + v
end

--[[Account.deposit(Account,200)
Account:withdraw(100)

print(Account.balance)]]

--[[local mt = {__index=Account}

function Account.new(o)
    o = o or {}
    setmetatable(o,mt)
    return o
end

a = Account.new{balance=100}
a:deposit(100)
print(a.balance)]]
function Account:new(o)
    o = o or {}
    self.__index = self
    setmetatable(o,self)
    return o
end

--b = Account:new()
--print(b.balance)
SpecialAccount = Account:new()
s = SpecialAccount:new{limit = 1000}
function SpecialAccount:withdraw(v)
    if v-self.balance>=self:getLimit() then
        error"insufficient funds"
    end
    self.balance = self.balance - v
end
function SpecialAccount:getLimit()
    return self.limit or 0
end
s:deposit(200)
print(s.balance)
function s:getLimit()
    return self.balance * 0.1
end
s:withdraw(250)
print(s.balance)