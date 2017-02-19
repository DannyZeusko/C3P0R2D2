self = {}

function tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end

local t = {02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02,
           02, 05, 04, 04, 04, 04, 04, 04, 04, 04, 04, 04, 04, 04, 04, 04, 04, 04, 06, 02,
           02, 07, 03, 03, 03, 03, 03, 03, 03, 03, 03, 03, 03, 03, 03, 03, 03, 03, 08, 02,
           02, 07, 03, 03, 03, 03, 03, 03, 03, 03, 03, 03, 03, 03, 03, 03, 03, 03, 08, 02,
           02, 07, 03, 03, 03, 03, 03, 03, 03, 03, 03, 03, 03, 03, 03, 03, 03, 03, 08, 02,
           02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, }
         
         
local tileSet = love.graphics.newImage("Assets/Tiles01.png") 
local image = {}
local roomWidth = 20  -- this is used by the tile drawing code

  for i=1,8  do 
  image[i] = love.graphics.newQuad((i-1)*64,0,64,64,tileSet:getDimensions() )
  end




function self.draw ()

  for i=1,tablelength(t),1  do 
     --love.graphics.draw(tileSet,image[01],  (i-1)*64 - (math.floor((i-1)/10)*640)    ,   (math.floor((i-1)/10)*64)    ,   0,   1,    1,   0  ,   0   , 0 , 0)
     love.graphics.draw(tileSet,image[t[i]],  (i-1)*64 - (math.floor((i-1)/roomWidth)*64*roomWidth)    ,   (math.floor((i-1)/roomWidth)*64)    ,   0,   1,    1,   0  ,   0   , 0 , 0)
     --love.graphics.draw(tileSet,0,0)
  end

end

return self