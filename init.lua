require("eddie")

local f = io.popen("uname -s")
if (f ~= nil) then
    MY_OS = f:read("*a")
    MY_OS = string.gsub(MY_OS, "%s+", "")
    f:close()
end
