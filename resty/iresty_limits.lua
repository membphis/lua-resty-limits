local _M = { _VERSION = '1.0' }

local mt = { __index = _M }

function _M.new(self)
	local shared_memory = ngx.shared.itesty_limit
    return setmetatable({ memory = shared_memory }, mt)
end


function _M.limit(self, zone, key, parallel, scope)
	scope = scope or 1
	local zone_key = zone .. ":" .. key .. ":" .. math.ceil (ngx.time()/scope)
	self.memory:add(zone_key, 0, 1)
	local cur_para = self.memory:incr(zone_key, 1)
	if cur_para > parallel then
		return true
	end
	
	return false
end

return _M
