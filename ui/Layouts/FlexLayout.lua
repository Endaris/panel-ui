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

---@param uiElement UiElement
function Layout.fitSizeWidth(uiElement)
  for _, child in ipairs(uiElement.children) do
    child.layout.fitSizeWidth(child)
  end
  local w = uiElement.layout.getMinWidth(uiElement)
  uiElement.width = math.max(w, uiElement.minWidth)
end

---@param uiElement UiElement
function Layout.fitSizeHeight(uiElement)
  for _, child in ipairs(uiElement.children) do
    child.layout.fitSizeHeight(child)
  end
  local h = uiElement.layout.getMinHeight(uiElement)
  uiElement.height = math.max(h, uiElement.minHeight)
end

---@param uiElement UiElement
function Layout.growChildrenWidth(uiElement)
  error("Layout does not implement growChildrenWidth")
end

---@param uiElement UiElement
function Layout.growChildrenHeight(uiElement)
  error("Layout does not implement growChildrenHeight")
end

---@param uiElement UiElement
function Layout.positionChildren(uiElement)
  error("Layout does not implement positionChildren")
end


return Layout