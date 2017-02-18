game = require ('game')
pause = require ('pause')
splash = require ('splash')

verbose = false

function love.load(arg)
  statenumber = 2 --sets the default gamestate to "in game", set to 1 for release

  gamestate = {splash.main, game.main, pause.pause}
  if arg and arg[#arg] == "-debug" then require("mobdebug").start() end
  if arg and arg[#arg] == "-v" then verbose = true end 
  myImage = love.graphics.newImage("pumpkin.jpg")
  
  love.window.setMode(1280,720)
  
  x = 0
  y = 0  
end


function love.update(dt)
  -- keyboard actions for our jpg
  if love.keyboard.isDown("left") then
    x= x-5
  end
  if love.keyboard.isDown("right") then
    x=x+5
  end
  
  if (love.keyboard.isDown("kp1")) then
    love.window.setFullscreen()  
  end

  gamestate[statenumber]() --this passes execution to the main() of whatever state we're in

end


function love.draw()
  love.graphics.draw (myImage,x,y,0,1,1,0,0,0,0)
end



