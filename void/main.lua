
math.randomseed(os.time())

local cos,sin,rad = math.cos,math.sin,math.rad

local screen_width, screen_height = love.graphics.getDimensions()
screen_width = screen_width / 2
screen_height = screen_height / 2

--local g3d = require "g3d"

function table.print(t)
  for k,v in ipairs(t) do
    print(v)
  end
end

local function load_modlist()
  files = io.open("mod_list.lua","w+")

  files:write("return {\n[[")
  for dir in io.popen([[dir "mods\" /s /b]]):lines() do

    if string.sub(dir,#dir-3,#dir) == ".lua" then
      --files[#files+1] = dir
      --files:seek("end")
      files:write(dir)
      files:write("]],\n[[")
    end
  end
  files:write("]]\n}")
  files:flush()
  
end

--table.print(files)
local LG = love.graphics
LG.setShader()

local x,y = 0,0
local objects = {
  x = {10},
  y = {0},
  d = {10},
}

local dir = {0,0}

love.graphics.setPointSize(10)

--[[function love.load()
  shader = love.graphics.newShader(io.open("shader.glsl"):read("*a"))
  local tmp = {}
  for i = 1 ,10 do
    tmp[#tmp+1] = {math.random(100,450),math.random(100,450)}
  end
  mesh = LG.newMesh(tmp,"triangles","static")
end]]


function love.draw()
  
  for k,v in ipairs(objects.x) do
    LG.points( (v + screen_width)* cos(rad(dir[1])) ,  (objects.y[k] + screen_height)* sin(rad(dir[1])) )
  end

end

function love.keyreleased(key,scancode)
  if key=="escape" then love.event.quit() end
end
