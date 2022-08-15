

--[[co = coroutine.create(function() print("hi") end)
print(type(co))
print(coroutine.status(co))
coroutine.resume(co)
print(coroutine.status(co))]]

co = coroutine.create(function(a,b,c)
    print("co",a,b,c+2)
end)
coroutine.resume(co,1,2,3)

co2 = coroutine.create(function(a,b)
    coroutine.yield(a+b,a-b)
end)
print(coroutine.resume(co2,20,10))

co3 = coroutine.create(function(x)
    print("co1",x)
    print("co2",coroutine.yield())
end)
coroutine.resume(co3,"hi")
coroutine.resume(co3,4,5)

co4 = coroutine.create(function()
    return 6,7
end)
print(coroutine.resume(co4))
