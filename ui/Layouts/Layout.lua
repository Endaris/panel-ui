---@class Layout
local Layout = Class(function() end)

function Layout:growChildrenWidth(children, delta)

end

function Layout:onChildrenChanged(uiElement)
  local oWidth = uiElement.width
  local oHeight = uiElement.height
  uiElement.layout:resize(uiElement)

  if oWidth ~= uiElement.width or oHeight ~= uiElement.height then
    if uiElement.parent then
      uiElement.parent.layout:onChildrenChanged(uiElement.parent)
    elseif uiElement.controlsWindow then
      love.window.updateMode(uiElement.width, uiElement.height, {})
    end
  end
end


return Layout