-- Utility methods for drawing
local Graphics = {
  fontFile = nil,
  fontSize = 12,
  fontCache = {},
  quadPool = {}
}

function Graphics.getAlignmentOffset(parentElement, childElement)
  local xOffset, yOffset
  if childElement.hAlign == "center" then
    xOffset = parentElement.width / 2 - childElement.width / 2
  elseif childElement.hAlign == "right" then
    xOffset = parentElement.width - childElement.width
  else -- if hAlign == "left" then
    -- default
    xOffset = 0
  end

  if childElement.vAlign == "center" then
    yOffset = parentElement.height / 2 - childElement.height / 2
  elseif childElement.vAlign == "bottom" then
    yOffset = parentElement.height - childElement.height
  else --if uiElement.vAlign == "top" then
    -- default
    yOffset = 0
  end

  return math.round(xOffset), math.round(yOffset)
end

-- sets the translation for a childElement inside of a parentElement so that
-- x=0, y=0 aligns the childElement inside the parentElement according to the settings
function Graphics.applyAlignment(parentElement, childElement)
  love.graphics.push("transform")
  love.graphics.translate(Graphics.getAlignmentOffset(parentElement, childElement))
end

-- resets the translation of the last alignment adjustment
function Graphics.resetAlignment()
  love.graphics.pop()
end

local loveMajor = love.getVersion()

if loveMajor >= 12 then
  Graphics.newText = love.graphics.newTextBatch
else
  Graphics.newText = love.graphics.newText
end

return Graphics