local N = 8
local function isPlaceok(a,n,c)
    for i = 1, n-1 do
        if (a[i]==c) or (a[i]-i==c-n) or (a[i]+i==c+n) then
            return false
        end
    end
    return true
end

local function PrintSo(a)
    for i = 1, N do
        for j = 1, N do
            io.write(a[i]==j and "X" or "-"," ")
        end
        io.write("\n")
    end
    io.write("\n")
end
local function AddQueen(a,n)
    if (n>N) then
        PrintSo(a)
        os.exit()
    else
        for c = 1, N do
            if isPlaceok(a,n,c) then
                a[n] = c
                AddQueen(a,n+1)
            end
        end
    end
end
AddQueen({},1)