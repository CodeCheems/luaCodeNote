--词法定界  lexical scoping

--圆心（1，3）半径4.5的圆
function disk1(x,y)
    return (x-1.0)^2 + (y-3.0)^2 <= 4.5^2
end

--根据指定圆心和半径创建圆盘的工厂
function disk(cx,cy,r)
    return function(x,y)
        return (x-cx)^2 + (y-cy)^2 <= r^2
    end
end

--创建一个指定边界的轴对称矩形
function rect(left,right,bottom,up)
    return function(x,y)
        return x<=left and x>=right
        and y<=up and y>=bottom
    end
end

--任意区域的补集
function complement(r)
    return function(x,y)
        return not r(x,y)
    end
end

--两个区域的差集
function difference(r1,r2)
    return function(x,y)
        return r1(x,y) and not r2(x,y)
    end
end

function translate(r,dx,dy)
    return function(x,y)
        return r(x-dx,y-dy)
    end
end

--在PBM文件中绘制区域
function plot(r,M,N)
    local file = io.open("test.pbm","w+")
    io.output(file)
    io.write("P1\n",M," ",N,"\n")  --文件头
    for i = 1, N do
        local y = (N-i*2)/N
        for j = 1, M do
            local x = (j*2-M)/M
            io.write(r(x,y) and "1" or "0")
        end
        io.write("\n")
    end
    io.close(file)
end

local c1 = disk(0,0,1)
plot(difference(c1,translate(c1,0.3,0)),500,500)

