local ui = require("ui")

local w, h = love.window.getDesktopDimensions(1)
local uiRoot = ui.UIElement({
  childGap = 16,
  padding = 32,
  width = w,
  height = h - 60,
  layout = ui.Layouts.VerticalFlexLayout,
  backgroundColor = {0, 0.8, 0.4, 0.5}
  --minWidth = 0,
  --minHeight = 0,
})
uiRoot.controlsWindow = true

local roomMode = ui.HorizontalRadioSelector({
  childGap = 8,
  padding = 8,
  hAlign = "center",
  --hFill = true,
  backgroundColor = {1, 0, 0, 0.5},
})

roomMode:addChild(ui.Text({text = "Battle", hAlign = "center", vAlign = "center"}))
roomMode:addChild(ui.Text({text = "Arcade", hAlign = "center", vAlign = "center"}))

uiRoot:addChild(roomMode)

local gameMode = ui.HorizontalRadioSelector({
  childGap = 8,
  padding = 8,
  backgroundColor = {0, 0, 1, 0.5},
  hAlign = "center",
--  hFill = true,
})

gameMode:addChild(ui.Text({text = "VS"}))
gameMode:addChild(ui.Text({text = "VS Self"}))
gameMode:addChild(ui.Text({text = "Time Attack"}))
gameMode:addChild(ui.Text({text = "Endless"}))
gameMode:addChild(ui.Text({text = "Puzzle"}))
gameMode:addChild(ui.Text({text = "Training"}))
gameMode:addChild(ui.Text({text = "Line Clear"}))

uiRoot:addChild(gameMode)

local subSelectionSelector = ui.UIElement({
  childGap = 8,
  padding = 8,
  hFill = true,
  backgroundColor = {0, 1, 0, 0.5}
})

subSelectionSelector:addChild(ui.Text({text = "Character"}))
subSelectionSelector:addChild(ui.Text({text = "Stage"}))
subSelectionSelector:addChild(ui.Text({text = "Panels"}))
subSelectionSelector:addChild(ui.Text({text = "Ranked"}))
subSelectionSelector:addChild(ui.Text({text = "Level"}))
subSelectionSelector:addChild(ui.Text({text = "Input Selection"}))
subSelectionSelector:addChild(ui.Text({text = "Puzzle"}))
subSelectionSelector:addChild(ui.Text({text = "Attack File"}))

uiRoot:addChild(subSelectionSelector)

local subSelection = ui.UIElement({
  hFill = true,
  minHeight = 400,
  vFill = true,
  backgroundColor = {0.7, 0, 0.5, 1},
})

uiRoot:addChild(subSelection)

uiRoot:addChild(ui.Text({text = "Ready", hAlign = "center"}))
uiRoot:addChild(ui.Text({text = "Leave", hAlign = "center"}))

return uiRoot