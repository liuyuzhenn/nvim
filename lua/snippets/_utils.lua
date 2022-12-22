local M = {}
function M.split(a, pattern)
	pattern = pattern or ","
	local elements = {}
	local pos = a:find(pattern)
	local ptr = 1
	while pos do
		if pos ~= ptr then
			local ele = a:sub(1, pos - 1)
			elements[#elements + 1] = ele
		end
		a = string.sub(a, pos + 1, #a)
		pos = string.find(a, pattern)
	end
	elements[#elements + 1] = (#a ~= 0) and a or nil
	return elements
end

return M
