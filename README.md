# lua-resty-limits
limit nginx request every seconds base on openresty

# Use exmaple

```lua
local limits = require("resty.iresty_limits")
local limits = limits.new()

-- the rate is 80bytes/seconds, you can input 80K(means 80KB/sec) too.
limits:rate("80")

-- 
ngx.say("check request is allowed: ", 
    limits:reqs_per_range(ngx.var.binary_remote_addr, ngx.var.uri, 1, 2))
```

provide by membphis@gmail.com

if you have any question, please let me know. 