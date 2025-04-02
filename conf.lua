function love.conf(t)
  t.identity = "Panel Attack UI"

  local loveMajor = love.getVersion()
  -- this version has wrappers to be compatible with either love 11 or 12
  -- by adjusting to the actual version we avoid the pop-up informing the user about potential compatibility problems
  if loveMajor >= 12 then
    t.version = "12.0"                -- The LÖVE version this game was made for (string)
    t.highdpi = true                  -- Enable high-dpi mode for the window on a Retina display (boolean)
  else
    t.version = "11.5"
    t.window.highdpi = true
  end

  t.window.title = "UI Playground"          -- The window title (string)
  t.window.resizable = true
  t.window.width = 1750
  t.window.height = 720

  t.modules.audio = true              -- Enable the audio module (boolean)
  t.modules.data = true               -- Enable the data module (boolean)
  t.modules.event = true              -- Enable the event module (boolean)
  t.modules.font = true               -- Enable the font module (boolean)
  t.modules.graphics = true           -- Enable the graphics module (boolean)
  t.modules.image = true              -- Enable the image module (boolean)
  t.modules.joystick = true           -- Enable the joystick module (boolean)
  t.modules.keyboard = true           -- Enable the keyboard module (boolean)
  t.modules.math = true               -- Enable the math module (boolean)
  t.modules.mouse = true              -- Enable the mouse module (boolean)
  t.modules.physics = false           -- Enable the physics module (boolean)
  t.modules.sound = true              -- Enable the sound module (boolean)
  t.modules.system = true             -- Enable the system module (boolean)
  t.modules.thread = true             -- Enable the thread module (boolean)
  t.modules.timer = true              -- Enable the timer module (boolean), Disabling it will result 0 delta time in love.update
  t.modules.touch = true              -- Enable the touch module (boolean)
  t.modules.video = false             -- Enable the video module (boolean)
  t.modules.window = true             -- Enable the window module (boolean)
end