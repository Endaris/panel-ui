local FlexLayout = require("ui.Layouts.FlexLayout")

---@class HorizontalFlexLayout : FlexLayout
local HorizontalFlexLayout = setmetatable({}, {__index = FlexLayout})

---@param uiElement UiElement
function HorizontalFlexLayout.getMinWidth(uiElement)
  local w = uiElement.padding * 2 + uiElement.childGap * (#uiElement.children - 1)

  for _, child in ipairs(uiElement.children) do
    w = w + child.width
  end

  return w
end

---@param uiElement UiElement
function HorizontalFlexLayout.getMinHeight(uiElement)
  local h = uiElement.padding * 2
  local maxHeight = 0

  for _, child in ipairs(uiElement.children) do
    maxHeight = math.max(maxHeight, child.height)
  end

  return h + maxHeight
end

---@param uiElement UiElement
function HorizontalFlexLayout.growChildrenWidth(uiElement)
  if #uiElement.children == 0 then
    return
  end

  local growables = {}

  for i, child in ipairs(uiElement.children) do
    if child.hFill and child.width < child.maxWidth then
      growables[#growables+1] = child
      child.newWidth = child.width
    end
  end

  if #growables > 0 then
    local remainingWidth = uiElement.width - uiElement.layout.getMinWidth(uiElement)

    while #growables > 0 and remainingWidth > 0 do
      local smallest = growables[1].newWidth
      local secondSmallest = math.huge
      -- if growables[1] is already the smallest, it will increment the counter at some point within the loop so we can't count it yet
      local smallestCount = 1

      for i = 2, #growables do
        local growable = growables[i]
        if growable.newWidth < smallest then
          secondSmallest = smallest
          smallest = growable.newWidth
          smallestCount = 1
        elseif growable.newWidth > smallest then
          secondSmallest = math.min(secondSmallest, growable.newWidth)
        else
          smallestCount = smallestCount + 1
        end
      end

      local delta = secondSmallest - smallest
      local widthToAdd = math.min(delta, remainingWidth / smallestCount)

      if delta * smallestCount >= remainingWidth then
        for _, growable in ipairs(growables) do
          if growable.newWidth == smallest then
            local toAdd = math.min(widthToAdd, growable.maxWidth - growable.newWidth)
            growable.newWidth = growable.newWidth + toAdd
            remainingWidth = remainingWidth - toAdd
          end
        end
        if remainingWidth < 1 then
          -- we could run into floating point shenanigans here
          remainingWidth = 0
        end
      else
        for _, growable in ipairs(growables) do
          if growable.newWidth == smallest then
            local toAdd = math.min(widthToAdd, growable.maxWidth - growable.newWidth)
            growable.newWidth = growable.newWidth + toAdd
            remainingWidth = remainingWidth - toAdd
          end
        end
      end

      for i = #growables, 1, -1 do
        local growable = growables[i]
        if growable.newWidth >= growable.maxWidth then
          growable.width = growable.newWidth
          table.remove(growables, i)
        end
      end
    end

    for _, growable in ipairs(growables) do
      growable.width = growable.newWidth
    end
  end

  for _, child in ipairs(uiElement.children) do
    child.layout.growChildrenWidth(child)
  end
end

---@param uiElement UiElement
function HorizontalFlexLayout.growChildrenHeight(uiElement)
  for _, child in ipairs(uiElement.children) do
    if child.vFill then
      child.height = math.min(uiElement.height - uiElement.padding * 2, child.maxHeight)
    end
    child.layout.growChildrenHeight(child)
  end
end

---@param uiElement UiElement
function HorizontalFlexLayout.positionChildren(uiElement)
  local remainingWidth = uiElement.width - (uiElement.padding * 2 + uiElement.childGap * (#uiElement.children - 1))
  for _, child in ipairs(uiElement.children) do
    remainingWidth = remainingWidth - child.width
  end

  local x = uiElement.padding
  for _, child in ipairs(uiElement.children) do
    if child.hAlign == "left" then
      child.x = x
    elseif child.hAlign == "center" then
      child.x = x + remainingWidth / 2
    elseif child.hAlign == "right" then
      child.x = x + remainingWidth
    end

    if child.vAlign == "top" then
      child.y = uiElement.padding
    elseif child.vAlign == "center" then
      child.y = (uiElement.height - child.height) / 2
    elseif child.vAlign == "bottom" then
      child.y = (uiElement.height - child.height) - uiElement.padding
    end
    child.x = math.round(child.x)
    child.y = math.round(child.y)
    x = x + uiElement.childGap + child.width
  end

  for _, child in ipairs(uiElement.children) do
    child.layout.positionChildren(child)
  end
end

return HorizontalFlexLayout