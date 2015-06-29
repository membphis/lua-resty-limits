local json = require("json")

local _M = { _VERSION = '1.0' }

local mt = { __index = _M }

function _M.new(self)
	local shared_memory = ngx.shared.itesty_limit
    return setmetatable({ memory = shared_memory }, mt)
end


function _M.limit(self, zone, key, rates)
	local limit_val_s = self.memory:get(zone .. ":" .. key) or "{}"
	local limit_val   = json.decode(limit_val_s)

	
	return true
end

return _M
