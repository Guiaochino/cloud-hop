--[[
    GD50
    -- Super Mario Bros. Remake --

    Author: Colton Ogden
    cogden@cs50.harvard.edu
]]

GameObject = Class{}

function GameObject:init(def)
    self.x = def.x
    self.y = def.y
    self.texture = def.texture
    self.width = def.width
    self.height = def.height
    self.frame = def.frame
    self.solid = def.solid
    self.collidable = def.collidable
    self.consumable = def.consumable
    self.onCollide = def.onCollide
    self.onConsume = def.onConsume
    self.hit = def.hit
end

function GameObject:collides(target)
    if (self.y + 2) - (self.height)  <= target.y then
        return true
    end
    
end

function GameObject:update(dt)

end

function GameObject:render()
    -- love.graphics.draw(gTextures[self.texture], gFrames[self.texture][self.frame], self.x, self.y)
    love.graphics.draw(gTextures['ground'], self.x, self.y)
end
