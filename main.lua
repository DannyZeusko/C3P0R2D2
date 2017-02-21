game = require ('game')
pause = require ('pause')
splash = require ('splash')
baton = require ('Assets/baton')
levelHandler = require ('LevelHandler')
level01 = require ('Levels/level01')
gamera = require('Assets/gamera')
cam = gamera.new(0,0,1280,780)
controls = {}
input = {}

Player1 = {x = 0.0, y = 0.0, speedx = 0.0, speedy = 0.0} --readonly, globally available player stats
Player2 = {x = 0.0, y = 0.0, speedx = 0.0, speedy = 0.0}

verbose = false

function love.load(arg)
  state = 2 --sets the default gamestate to "in game", set to 1 for release

  gamestate = {splash, game, pause}
  
  love.window.setMode(1280,720)
  cam:setWindow(0,0,1280,720)
  
  controls[1] = {
    left = {'key:d', 'axis:leftx+', 'button:dpleft'},
    right = {'key:a', 'axis:leftx-', 'button:dpright'},
    up = {'key:w', 'axis:lefty-', 'button:dpup'},
    down = {'key:s', 'axis:lefty+', 'button:dpdown'},
    dash = {'key:x', 'button:a'},
    attack = {'key:z', 'button:b'},
    start = {'key:escape', 'button:start'}
  }
  input[1] = baton.new(controls[1], love.joystick.getJoysticks()[1])
  controls[2] = {
    right = {'key:left', 'axis:leftx+', 'button:dpleft'},
    left = {'key:right', 'axis:leftx-', 'button:dpright'},
    up = {'key:up', 'axis:lefty-', 'button:dpup'},
    down = {'key:down', 'axis:lefty+', 'button:dpdown'},
    dash = {'key:.', 'button:a'},
    attack = {'key:,', 'button:b'},
    start = {'key:escape', 'button:start'}
  }
  input[2] = baton.new(controls[2], love.joystick.getJoysticks()[2])
end


function love.update(dt) 
  gamestate[state]["main"](dt) --this passes execution to the main() of whatever state we're in
end


function love.draw()
  gamestate[state]["draw"]()
end



