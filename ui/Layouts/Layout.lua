---@class Layout
local Layout = {}

---@param uiElement UiElement
---@param width number?
---@param height number?
function Layout.resize(uiElement, width, height)
  uiElement.layout.fitSizeWidth(uiElement)
  if width then
    uiElement.width = math.max(width, uiElement.width)
  end
  uiElement.layout.growChildrenWidth(uiElement)

  -- transform width to height for width-to-height supporting uiElements based on the width pass
  uiElement:setMinHeightForWidth()

  uiElement.layout.fitSizeHeight(uiElement)
  if height then
    uiElement.height = math.max(height, uiElement.height)
  end
  uiElement.layout.growChildrenHeight(uiElement)

  uiElement.layout.positionChildren(uiElement)
end

function Layout.fitSizeWidth(uiElement)
  error("Layout does not implement fitSizeWidth")
end

function Layout.growChildrenWidth(uiElement)
  error("Layout does not implement growChildrenWidth")
end

function Layout.fitSizeHeight(uiElement)
  error("Layout does not implement fitSizeHeight")
end

function Layout.growChildrenHeight(uiElement)
  error("Layout does not implement growChildrenHeight")
end

function Layout.positionChildren(uiElement)
  error("Layout does not implement positionChildren")
end


return Layout