self = {} -- after some consideration, and in the absence fo any way to do inheritence or polymorphism quickly, 
          -- We should make one object type that has litterally all logic and state that any object in the game can have


self.x = 0.0 
self.y = 0.0
self.speedx = 0.0
self.speedy = 0.0
self.speed = 30.0

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
                if control == "left" then self.speedx = self.speed end
                if control == "right" then self.speedx = -self.speed end
                if control == "down" then self.speedy = self.speed end
                if control == "up" then self.speedy = -self.speed end
                if control == "dash" then 
                    self.speedx = self.speedx * 2 
                    self.speedy = self.speedy * 2    
                end
            end
            if input[self.player]:released(control) then
                if control == "left" then self.speedx = 0 end
                if control == "right" then self.speedx = 0 end
                if control == "down" then self.speedy = 0 end
                if control == "up" then self.speedy = 0 end
                if control == "dash" then 
                    self.speedx = self.speedx / 2 
                    self.speedy = self.speedy / 2 
                end
            end
        end
    end


    if self.is_ball == true then

    end

    if self.is_enemy == true then

    end

    self.x = self.x + self.speedx * dt
    self.y = self.y + self.speedy * dt

end

function self.draw()
    love.graphics.draw (self.spriteDown,self.x,self.y,0,self.facing,1,0,0,0,0)
end

return self