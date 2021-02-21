
Icon = Class{__includes = BaseState}

function Icon:init(texture, x, y, width, height)
    self.texture = texture
    self.x = x
    self.y = y
    self.width = width
    self.height = height
end

function Icon:render()
    love.graphics.draw(gTextures[self.texture], self.x, self.y)
end