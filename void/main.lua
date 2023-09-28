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

function love.draw()
end