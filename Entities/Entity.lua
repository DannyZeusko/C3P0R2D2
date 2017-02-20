self = {}  
local this = self


self.x = {} 
self.y = {}
self.speedx = {}
self.speedy = {}
self.speed = {}

self.headUp = {} --temp values will replace for a more comprehensive solution later
self.headDown = {}
self.bodyUp = {} 
self.bodyDown = {}
self.rarm = {} 
self.rhand = {}
self.bottom = {} 
self.offset = {}
self.facing = {}
self.colour = {}

self.is_player = {}
self.player = {}
self.is_enemy = {}

self.has_ball = {}
self.is_ball = {}
self.ball_thrown = {}


function self.enemyMove(which)
    
end

function self.playerMove(which)


end

function self.ballMove(which)

end

function self.throwBall(which)

end

function self.update(which, dt)
    if this.is_player[which] == true then
        input[this.player[which]]:update()
        for control in pairs(controls[this.player[which]]) do
            if input[this.player[which]]:pressed(control) then
                if control == "left" then this.speedx[which] = this.speed[which] end
                if control == "right" then this.speedx[which] = -this.speed[which] end
                if control == "down" then this.speedy[which] = this.speed[which] end
                if control == "up" then this.speedy[which] = -this.speed[which] end
                if control == "dash" then 
                    this.speedx[which] = this.speedx[which] * 2 
                    this.speedy[which] = this.speedy[which] * 2    
                end
            end
            if input[this.player[which]]:released(control) then
                if control == "left" then this.speedx[which] = 0 end
                if control == "right" then this.speedx[which] = 0 end
                if control == "down" then this.speedy[which] = 0 end
                if control == "up" then this.speedy[which] = 0 end
                if control == "dash" then 
                    this.speedx[which] = this.speedx[which] / 2 
                    this.speedy[which] = this.speedy[which] / 2 
                end
            end
        end
    end


    if this.is_ball == true then

    end

    if this.is_enemy == true then

    end

    this.x[which] = this.x[which] + this.speedx[which] * dt
    this.y[which] = this.y[which] + this.speedy[which] * dt
    if this.player[which] == 1 then
        Player1 = {x = this.x[which], y = this.y[which], speedx = this.speedx[which], speedy = this.speedy[which]}
    else
        Player2 = {x = this.x[which], y = this.y[which], speedx = this.speedx[which], speedy = this.speedy[which]}
    end

end

function self.draw(which)
    if this.spriteDown[which] == not nil then
        love.graphics.draw (this.spriteDown[which],this.x[which],this.y[which],0,this.facing[which],1,0,0,0,0)
    end
end

return self