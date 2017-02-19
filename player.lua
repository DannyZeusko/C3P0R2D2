self = {}

local mergedControls = require ('mergedControls')


  cx = {}
  cy = {}
  chead = {}
  cbody = {}
  carm = {}
  chand = {}
  chealth = {}
  cspeedx = {}
  cspeedy = {}

  head = love.graphics.newImage('Assets/rhead.png')
  body = love.graphics.newImage('Assets/rbody.png')
  arm = love.graphics.newImage('Assets/rarm.png')
  hand = love.graphics.newImage('Assets/rhand.png')

  for i = 1,2 do
    
    cx[i] = i*100
    cy[i] = i*100
    chead[i] = head
    cbody[i] = body
    carm[i] = arm
    chand[i] = hand
    chealth[i] = 100
    cspeedx[i] =  0
    cspeedy[i] = 0


  end
  
  
  function self.update()
      
    for i = 1,2 do
      if mergedControls.dpadUp(1) then
      cy[i] = cy[i]-1
      end
    end
    
  end
  
  function self.draw()
    for i = 1,2 do
    love.graphics.draw(chead[i],cx[i],cy[i])
    end
  end
  
return self