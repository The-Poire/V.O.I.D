
math.randomseed(os.time())

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

function love.load()
  shader = love.graphics.newShader(io.open("shader.glsl"):read("*a"))
  local tmp = {}
  for i = 1 ,10 do
    tmp[#tmp+1] = {math.random(100,450),math.random(100,450)}
  end
  mesh = LG.newMesh(tmp,"triangles","static")
end
function love.draw()
  love.graphics.setShader(shader)


  LG.setColor(1,0,0)--[[
    (math.cos(love.timer.getTime())+1)/2,
    (math.cos(love.timer.getTime())+1)/2,
    (math.cos(love.timer.getTime())+1)/2
  )]]

  shader:send("time",love.timer.getTime())

  LG.draw(mesh)

  love.graphics.setShader()
end

function love.keyreleased(key,scancode)
  if key=="escape" then love.event.quit() end
end
