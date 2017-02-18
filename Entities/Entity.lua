self = {} -- after some consideration, and in the absence fo any way to do inheritence or polymorphism quickly, 
          -- We should make one object type that has litterally all logic and state that any object in the game can have


self.x = 0.0 
self.y = 0.0
self.speedx = 0.0
self.speedy = 0.0

self.sprite = nil

self.has_ball = false
self.is_ball = false

function enemyMove()
    
end

function playerMove()

end

return self