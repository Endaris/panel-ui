function math.round(number, numberOfDecimalPlaces)
  if number == 0 then
    return number
  end
  local multiplier = 10^(numberOfDecimalPlaces or 0)
  if number > 0 then
    return math.floor(number * multiplier + 0.5) / multiplier
  else
    return math.ceil(number * multiplier - 0.5) / multiplier
  end
end