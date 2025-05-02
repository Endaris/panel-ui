Class = require("class")
require("mathExtensions")
require("stringExtensions")
require("util")

if os.getenv("LOCAL_LUA_DEBUGGER_VSCODE") == "1" then
  require("lldebugger").start()
  DEBUG_ENABLED = 1
end

local uiRoot

function love.load(arg)
  uiRoot = require("battleRoomScene")
end

function love.update(dt)
  --uiRoot:update(dt)
end

function love.draw()
  uiRoot:draw()
end

local errHandler = love.errorhandler
function love.errorhandler(msg)
  if lldebugger then
    error(msg, 2)
  end

  errHandler(msg)
end

function love.resize(width, height)
  if uiRoot then
    uiRoot.minWidth = width
    uiRoot.minHeight = height
    print("calling uiRoot.layout.resize with width " .. width .. " height " .. height)
    uiRoot.layout.resize(uiRoot, width, height)
    if uiRoot.width > width or uiRoot.height > height then
      love.window.updateMode(math.max(uiRoot.width, width), math.max(uiRoot.height, height), {})
    end
  end
end