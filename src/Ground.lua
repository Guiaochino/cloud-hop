Ground = Class{}

function Ground:init(x, y, id, width, height)
    self.x = 0
    self.y = VIRTUAL_HEIGHT - 40
    self.width = 500
    self.height = 16
end

function Ground:collidable(target)
    for k, v in pairs(COLLIDABLE_TILES) do
        if v == self.id then
            return true
        end
    end

    return false
end

function Ground:render()
    love.graphics.draw(gTextures['ground'], self.x, self.y)
end