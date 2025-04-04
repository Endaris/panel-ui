local ui = require("ui")

local w, h = love.window.getDesktopDimensions(1)
local uiRoot = ui.UIElement({
  childGap = 32,
  padding = 32,
  width = w,
  height = h - 60,
  --minWidth = 0,
  --minHeight = 0,
})
uiRoot.controlsWindow = true

local panel = ui.UIElement({
  childGap = 32,
  padding = 32,
  backgroundColor = {0.7, 0, 0.5, 1},
  maxWidth = 1920,
  maxHeight = 1060,
  minWidth = 800,
  minHeight = 450,
  hFill = true,
  vFill = true,
})

local section1 = ui.Text({
  width = 300,
  height = 300,
  backgroundColor = {0, 1, 0, 0.5}
})

local section2 = ui.UIElement({
  --hFill = true,
  hAlign = "center",
  vFill = true,
  minWidth = 100,
  --width = 100,
  maxWidth = 500,
  height = 200,
  maxHeight = 700,
  backgroundColor = {0, 0, 1, 0.5}
})

local section5 = ui.UIElement({
  --hFill = true,
  hAlign = "center",
  vAlign = "bottom",
  minWidth = 100,
  --width = 100,
  maxWidth = 500,
  height = 200,
  maxHeight = 700,
  backgroundColor = {0, 0, 1, 0.5}
})

local section3 = ui.UIElement({
  --hFill = true,
  hAlign = "right",
  --vAlign = "center",
  padding = 64,
  minWidth = 300,
  height = 300,
  backgroundColor = {1, 0, 0, 0.5},
  layout = ui.Layouts.VerticalFlexLayout
})

local section4 = ui.Text({
  backgroundColor = {0, 0, 0, 1}
})

local section6 = ui.UIElement({
  vFill = true,
  hFill = true,
  backgroundColor = {0, 0.8, 0.4, 0.5}
})

section3:addChild(section4)
section3:addChild(section6)

panel:addChild(section1)
panel:addChild(section2)
panel:addChild(section5)
panel:addChild(section3)
uiRoot:addChild(panel)

return uiRoot