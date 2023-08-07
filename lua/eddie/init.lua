require("eddie.keymaps")
require("eddie.options")

local f = io.popen("uname -s")
if (f ~= nil) then
MY_OS = f:read("*a")
f:close()
end

print(MY_OS)
