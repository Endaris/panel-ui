local util = {}

-- bounds b so a<=b<=c
function util.bound(a, b, c)
  if b < a then
    return a
  elseif b > c then
    return c
  else
    return b
  end
end

return util