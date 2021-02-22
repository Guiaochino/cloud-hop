
Icon = Class{__includes = BaseState}

function Icon:init(texture, x, y, width, height, toState)
    self.texture = texture
    self.x = x
    self.y = y
    self.width = width
    self.height = height
    self.toState = toState
end

function Icon:update(dt)

    local left_click = love.mouse.isDown(1)

    if distanceBetween(self.x, self.y) < ICON_SIZE and left_click then
        gStateMachine:change(self.toState)
    end
    
end

function Icon:render()
    love.graphics.draw(gTextures[self.texture], self.x, self.y)
end