local UiElement = require("ui.UIElement")

local Text = Class(function(self, options)
  self.text = options.text or "Lorem ipsum dolor imet tinga darim batsi frum. Lorem ipsum dolor imet tinga darim batsi frum. Lorem ipsum dolor imet tinga darim batsi frum."
  self.font = love.graphics.getFont()
  local words = self.text:split()
  local max = self.font:getWidth(words[1])
  for i = 2, #words do
    max = math.max(max, self.font:getWidth(words[i]))
  end
  self.minWidth = options.minWidth or max
  self.width = options.width or self.font:getWidth(self.text)
  self.maxWidth = options.maxWidth or self.font:getWidth(self.text)
  self.minHeight = options.minHeight or self.font:getHeight()
  self.height = options.height or self.font:getHeight()
  self.maxHeight = options.maxHeight or (#words * self.font:getHeight())
  self.hFill = true
  self.vFill = false
end,
UiElement)

function Text:drawSelf()
  UiElement.drawSelf(self)
  love.graphics.printf(self.text, self.x, self.y, self.width)
end

local refText = love.graphics.newText(love.graphics.getFont())

function Text:setMinHeightForWidth()
  refText:setf(self.text, self.width, "left")
  self.minHeight = refText:getHeight()
end

return Text