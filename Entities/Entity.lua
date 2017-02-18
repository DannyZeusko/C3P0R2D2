local baton = require ("Assets/baton")

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

function enemyMove()
    
end

function playerMove()

end

function ballMove()

end

function throwBall()

end



return self