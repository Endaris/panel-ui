local UiElement = require("ui.UIElement")
local HorizontalFlexLayout = require("ui.Layouts.HorizontalFlexLayout")

---@class HorizontalRadioSelector : UiElement
---@field selectedIndex integer
local HorizontalRadioSelector = Class(function(self, options)
  self.selectedIndex = 1
end,
UiElement)

HorizontalRadioSelector.layout = HorizontalFlexLayout

function HorizontalRadioSelector:drawChildren()
  for i, uiElement in ipairs(self.children) do
    if uiElement.isVisible then
      uiElement:draw()
      if i == self.selectedIndex then
        love.graphics.setColor(0.3, 0.7, 0.1, 0.6)
        love.graphics.rectangle("line", uiElement.x, uiElement.y, uiElement.width, uiElement.height)
        love.graphics.setColor(1, 1, 1, 1)
      end
    end
  end
end

return HorizontalRadioSelector