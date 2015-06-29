local limits = require("resty.iresty_limits")
local limits = limits.new()

ngx.say(limits:limit("zone", "key", 1))

ngx.say(math.ceil (61/2))
