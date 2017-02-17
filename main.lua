-- from [LÖVE tutorial, part 2](http://www.headchant.com/2010/12/31/love2d-%E2%80%93-tutorial-part-2-pew-pew/)
local game = require ('game')
local pause = require ('pause')
local splash = require ('splash')
verbose = false
statenumber = 4
gamestate = {1 = splash.main, 2 = game.main, 3 = pause.main, 4 = nestedfunctest}

function love.load(arg)
  if arg and arg[#arg] == "-debug" then require("mobdebug").start() end
  if arg and arg[#arg] == "-v" then verbose = true end 
  myImage = love.graphics.newImage("pumpkin.jpg")
  
  love.window.setMode(1280,720)
  
  x = 0
  y = 0
  Hero = {}
  Hero.sprite = nil
  Hero.x = 0
  Hero.y = 0
  
  
  
end

--function love.keyreleased(key)
  -- in v0.9.2 and earlier space is represented by the actual space character ' ', so check for both
--  if (key == " " or key == "space") then
--    shoot()
--  end
--end

function love.update(dt)
  -- keyboard actions for our hero
  if love.keyboard.isDown("left") then
    x= x-5
  end
  if love.keyboard.isDown("right") then
    x=x+5
  end
  
  if (love.keyboard.isDown("kp1")) then
    love.window.setFullscreen()  
  end

  gamestate[statenumber]()
--   hero.x = hero.x - hero.speed*dt
--  end

  --local remEnemy = {}
  --local remShot = {}



  -- remove the marked enemies
 -- for i,v in ipairs(remEnemy) do
 --   table.remove(enemies, v)
 -- end 
end



function nestedfunctest()
  print('this works')
end

function love.draw()
  love.graphics.draw (myImage,x,y,0,1,1,0,0,0,0)
  -- let's draw a background
  --love.graphics.setColor(255,255,255,255)

  -- let's draw some ground
  --love.graphics.setColor(0,255,0,255)
  --love.graphics.rectangle("fill", 0, 465, 800, 150)

  --for i,v in ipairs(enemies) do
    --love.graphics.rectangle("fill", v.x, v.y, v.width, v.height)
  --end
end



