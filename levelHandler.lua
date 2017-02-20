self = {}

--function tablelength(T)  -- Put # before the table name, returns the count
--  local count = 0
--  for _ in pairs(T) do count = count + 1 end
--  return count
--end

local t = {02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02,
           02, 05, 04, 04, 04, 04, 04, 04, 04, 04, 04, 04, 04, 04, 04, 04, 04, 04, 06, 02,
           02, 07, 03, 03, 03, 03, 03, 03, 03, 03, 03, 03, 03, 03, 03, 03, 03, 03, 08, 02,
           02, 07, 03, 03, 03, 03, 03, 03, 03, 03, 03, 03, 03, 03, 03, 03, 03, 03, 08, 02,
           02, 07, 03, 03, 03, 03, 03, 03, 03, 03, 03, 03, 03, 03, 03, 03, 03, 03, 08, 02,
           02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, }
         

local map = require ("Levels/Biglevel")         
local tileSet = love.graphics.newImage("Assets/Tiles01.png")
local tilesets = {}
local image = {}
local roomWidth = 20  -- this is used by the tile drawing code

  for i=1,8  do 
  image[i] = love.graphics.newQuad((i-1)*64,0,64,64,tileSet:getDimensions() )
  end




function self.draw ()

  for i=1,#t,1  do 
     --love.graphics.draw(tileSet,image[01],  (i-1)*64 - (math.floor((i-1)/10)*640)    ,   (math.floor((i-1)/10)*64)    ,   0,   1,    1,   0  ,   0   , 0 , 0)
     love.graphics.draw(tileSet,image[t[i]],  (i-1)*64 - (math.floor((i-1)/roomWidth)*64*roomWidth)    ,   (math.floor((i-1)/roomWidth)*64)    ,   0,   1,    1,   0  ,   0   , 0 , 0)
     --love.graphics.draw(tileSet,0,0)
  end

end

function self.prepquads(new)
  level = new
  for tset = 1, #map.tilesets do
	
		tilesetImage[tset] = love.graphics.newImage( "Map/"..map.tilesets[tset].image)
		
		repeat                -- get current image's number of tiles wide. Find more efficeint way to do this in the future. math.floor
			i = i + map.tilesets[tset].tilewidth
			tilesetX = tilesetX + 1
			if i > map.tilesets[tset].imagewidth then
				tilesetX = tilesetX - 1 
			end
		until i >= map.tilesets[tset].imagewidth
   
		repeat                -- same as above, but for height
			j = j + map.tilesets[tset].tileheight
			tilesetY = tilesetY + 1
			if j > map.tilesets[tset].imageheight then
				tilesetY = tilesetY - 1 
			end
		until j >= map.tilesets[tset].imageheight
		
		for j = 0, tilesetY - 1 do                         
			for i = 0, tilesetX - 1 do
				love.graphics.draw(screen)
				quadNumber = quadNumber + 1 
				mapQuad[quadNumber] = love.graphics.newQuad( map.tilesets[tset].tilewidth*i, map.tilesets[tset].tileheight*j, map.tilewidth, map.tileheight, map.tilesets[tset].imagewidth, map.tilesets[tset].imageheight)
				map.tilesets[tset].lastgid = quadNumber
				--print (map.tilesets[tset].lastgid)
			end
		end
		
		--object_load()
		
	-----------------------------------makes sprite batches out of all the layers	
		for layer = 1, #map.layers do
			--including object layers
			if map.layers[layer].type == "objectgroup" then
				SpriteBatch[layer] = love.graphics.newSpriteBatch( tilesetImage[1], #map.layers[layer].objects )
				--print ("object layer batched".. layer)
				for h = 1, #map.layers[layer].objects do
					if map.layers[layer].objects[h].gid ~= nil then
						SpriteBatch[layer]:addq( mapQuad[map.layers[layer].objects[h].gid], map.layers[layer].objects[h].x, map.layers[layer].objects[h].y+map_offset_y)
						--print("object quaded")
					end
				end
			end
			
			if map.layers[layer].type == "tilelayer" then
				SpriteBatch[layer] = love.graphics.newSpriteBatch( tilesetImage[1], #map.layers[layer].data )
				tile = 1   											--stores the position in 1-dimensional array we're getting our tile from during 2d draw. is acrued over each X-axis passing in a layer, but rewritten for a new layer
				--print ("layer batched".. layer)
				for mapdy = 1, map.layers[layer].height do
					for mapdx = 1, map.layers[layer].width do
						if map.layers[layer].data[tile] > 0 then  --if there's nothing, don't draw it.
							SpriteBatch[layer]:addq( mapQuad[map.layers[layer].data[tile]], (mapdx*map.tilewidth)+map_offset_x, (mapdy*map.tileheight)+map_offset_y )
						end
						tile = tile + 1
					end
				end
			end
		end
	end
end



return self