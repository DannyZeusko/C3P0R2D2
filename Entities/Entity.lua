local baton = require ("Assets/baton")
local input

self = {} -- after some consideration, and in the absence fo any way to do inheritence or polymorphism quickly, 
          -- We should make one object type that has litterally all logic and state that any object in the game can have


self.x = 0.0 
self.y = 0.0
self.speedx = 0.0
self.speedy = 0.0

self.spriteUp = nil
self.spriteDown = nil
self.facing = 1.0

self.has_ball = false
self.is_ball = false
self.bal_thrown = false

if playerno == 1 then
    local controls = {
        left = {'key:d', 'axis:leftx-', 'button:dpleft'},
        right = {'key:a', 'axis:leftx+', 'button:dpright'},
        up = {'key:w', 'axis:lefty-', 'button:dpup'},
        down = {'key:d', 'axis:lefty+', 'button:dpdown'},
        dash = {'key:x', 'button:a'},
        attack = {'key:z', 'button:b'}
    }
    local input = baton.new(controls, love.joystick.getJoysticks()[1])
else
    local controls = {
        left = {'key:left', 'axis:leftx-', 'button:dpleft'},
        right = {'key:right', 'axis:leftx+', 'button:dpright'},
        up = {'key:up', 'axis:lefty-', 'button:dpup'},
        down = {'key:down', 'axis:lefty+', 'button:dpdown'},
        dash = {'key:,', 'button:a'},
        attack = {'key:.', 'button:b'}
    }
    local input = baton.new(controls, love.joystick.getJoysticks()[2])
end
function enemyMove()
    
end

function playerMove()

end

function ballMove()

end

function throwBall()

end



return self