
require "socket"
local socket = require("socket.core")
--[[print(socket._VERSION)

local host = "www.lua.org"
file = "/manual/5.3/manual.html"
c = assert(socket.connect(host,80))
local request = string.format(
        "GET %s HTTP/1.0\r\nhost:%s\r\n\r\n",file,host
)
c:send(request)
local f = io.open("dl.lua","a")
io.output(f)
repeat
    local s,status,partial = c:receive(2^10)
    io.write(s or partial)
until status=="closed"
io.close(f)
c:close()]]

function receive(connection)
    connection:settimeout(0)
    local s,status,partial = connection:receive(2^10)
    if status=="timeout" then
        coroutine.yield(connection)
    end
    return s or partial,status
end

function download(host,file,name)
    local c = assert(socket.connect(host,80))
    local count = 0
    local request = string.format("GET %s HTTP/1.0\r\nhost: %s\r\n\r\n",file,host)
    c:send(request)
    local f = io.open(name,"wb")

    while true do
        local s,status = receive(c)
        count = count+#s
        f:write(s)
        if status=="closed" then
            break
        end
    end
    f:close()
    c:close()
    print(file,count)
end

tasks = {}
function get (host,file,name)
    local co = coroutine.wrap(function()
        download(host,file,name)
    end)
    table.insert(tasks,co)
end
function dispatch()
    local i=1
    local timeout = {}
    while true do
        if tasks[i]==nil then
            if tasks[1]==nil then
                break
            end
            i=1
            timeout = {}
        end
        local res = tasks[i]()
        if not res then
            table.remove(tasks,i)
        else
            i=i+1
            timeout[#timeout+1] = res
            if #timeout == #tasks then
                socket.select(timeout)
            end
        end
    end
end

get("www.lua.org","/ftp/lua-5.3.2.tar.gz","3p2.gz")
get("www.lua.org","/ftp/lua-5.3.1.tar.gz","3p1.gz")
get("www.lua.org","/ftp/lua-5.3.0.tar.gz","3p0.gz")
get("www.lua.org","/ftp/lua-5.2.4.tar.gz","2p4.gz")
get("www.lua.org","/ftp/lua-5.2.3.tar.gz","2p3.gz")
dispatch()