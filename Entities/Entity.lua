self = {} -- after some consideration, and in the absence fo any way to do inheritence or polymorphism quickly, 
          -- We should make one object type that has litterally all logic and state that any object in the game can have


self.x = 0.0 
self.y = 0.0
self.speedx = 0.0
self.speedy = 0.0
self.allowedSpeed = 5.0

self.spriteUp = nil
self.spriteDown = nil
self.facing = 1.0

self.is_player = false
self.player = 0
self.is_enemy = false

self.has_ball = false
self.is_ball = false
self.bal_thrown = false


function self.enemyMove()
    
end

function self.playerMove()


end

function self.ballMove()

end

function self.throwBall()

end

function self.update(dt)
    if self.is_player == true then
        input[self.player]:update()
        for control in pairs(controls[self.player]) do
            if input[self.player]:pressed(control) then
                print(control, 'pressed')
            end
            if input[self.player]:released(control) then
                print(control, 'released')
            end
        end
    end


    if self.is_ball == true then

    end

    if self.is_enemy == true then

    end

end



return self