local redis = require "resty.redis"
local template = require "resty.template"

local red, err = redis:new()
if not red then
	ngx.say("Failed to new: ", err)
end

red:set_timeout(1000) -- 1 sec
local ok, err = red:connect("192.168.199.229", 6379)
if not ok then
	ngx.say("Failed to connect: ", err)
end


--close the red of redis new
red:close()

