self = {} -- after some consideration, and in the absence fo any way to do inheritence or polymorphism quickly, 
          -- We should make one object type that has litterally all logic and state that any object in the game can have


self.x = {} 
self.y = {}
self.speedx = {}
self.speedy = {}
self.speed = {}

self.spriteUp = {} --temp values will replace for a more comprehensive solution later
self.spriteDown = {}
self.facing = {}

self.is_player = {}
self.player = {}
self.is_enemy = {}

self.has_ball = {}
self.is_ball = {}
self.bal_thrown = {}


function self.enemyMove(which)
    
end

function self.playerMove(which)


end

function self.ballMove(which)

end

function self.throwBall(which)

end

function self.update(which, dt)
    if self.is_player[which] == true then
        input[self.player[which]]:update()
        for control in pairs(controls[self.player[which]]) do
            if input[self.player[which]]:pressed(control) then
                if control == "left" then self.speedx[which] = self.speed[which] end
                if control == "right" then self.speedx[which] = -self.speed[which] end
                if control == "down" then self.speedy[which] = self.speed[which] end
                if control == "up" then self.speedy[which] = -self.speed[which] end
                if control == "dash" then 
                    self.speedx[which] = self.speedx[which] * 2 
                    self.speedy[which] = self.speedy[which] * 2    
                end
            end
            if input[self.player[which]]:released(control) then
                if control == "left" then self.speedx[which] = 0 end
                if control == "right" then self.speedx[which] = 0 end
                if control == "down" then self.speedy[which] = 0 end
                if control == "up" then self.speedy[which] = 0 end
                if control == "dash" then 
                    self.speedx[which] = self.speedx[which] / 2 
                    self.speedy[which] = self.speedy[which] / 2 
                end
            end
        end
    end


    if self.is_ball == true then

    end

    if self.is_enemy == true then

    end

    self.x[which] = self.x[which] + self.speedx[which] * dt
    self.y[which] = self.y[which] + self.speedy[which] * dt

end

function self.draw(which)
    love.graphics.draw (self.spriteDown[which],self.x[which],self.y[which],0,self.facing[which],1,0,0,0,0)
end

return self