local redis = require "resty.redis"

local red = redis:new()
red:set_timeout(1000)

local ok, err = red:connect("192.168.199.229", 6379)
if not ok then
    ngx.say("faied to connect: ", err)
    return
end

ok, err = red:set("dog", "an animal")
if not ok then
	ngx.say("faied to set dog : ", err)
	return
end

ngx.say("set result: ", ok)
local result = red:get("dog")
ngx.say(result)


--字典缓存 shared_dict(纯内存多个worker同时工作，锁的操作)
--第一步在nginx.conf里面增加 lua_shared_dict my_cache 128m;
--第二步
function get_from_cache(key)
	local my_cache = ngx.shared.my_cache
	local value = my_cache:get(key)
	return value
end
---------------------------------
local lrucache = require "resty.lrucache"

local c = lrucacache.new(200)
if not c then
	return error("faied to create the cathe: " .. (err or "unkown"))
end
c:set("dog", 32)
ngx.say(c:get("dog"))