self = {} -- after some consideration, and in the absence fo any way to do inheritence or polymorphism quickly, 
          -- We should make one object type that has litterally all logic and state that any object in the game can have


self.x = {} 
self.y = {}
self.speedx = {}
self.speedy = {}
self.speed = {}

self.spriteUp = {}
self.spriteDown = {}
self.facing = 1.0

self.is_player = {}
self.player = {}
self.is_enemy = {}

self.has_ball = {}
self.is_ball = {}
self.bal_thrown = {}


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
    print(self)
    print(self.spriteDown)
    love.graphics.draw (self.spriteDown,self.x,self.y,0,self.facing,1,0,0,0,0)
end

return self