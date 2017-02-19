 local self = {}

  local joysticks = love.joystick.getJoysticks()
  local deadzone = 0.4
  joystickA = joysticks[1]
  

  function self.dpadUp(player)
    if love.keyboard.isDown('up') or joysticks[player]:getGamepadAxis("lefty")<-deadzone then
      --print('up')
      return true
    end
  end
  
  function self.dpadDown(player)
    if love.keyboard.isDown('down') or joysticks[player]:getGamepadAxis("lefty")>deadzone then
      --print('down')
      return true
    end
  end
  
  function self.dpadRight(player)
    if love.keyboard.isDown('right') or joysticks[player]:getGamepadAxis("leftx")>deadzone then
      --print('right')
      return true
    end
  end
  
  function self.dpadLeft(player)
    if love.keyboard.isDown('left') or joysticks[player]:getGamepadAxis("leftx")<-deadzone then
      --print('left')
      return true
    end
  end
  
return self