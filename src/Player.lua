

Player = Class{__includes = Entity}

function Player:init(def)
    Entity.init(self, def)
end

function Player:update(dt)
    Entity.update(self, dt)
end

function Player:render()
    
    Entity.render(self)
end

function Player:checkLeftCollisions(dt)

    
    -- place player outside the X bounds on one of the tiles to reset any overlap
    if self.x == 0 then
        self.x = 0
    else
        
        self.y = self.y - 1
        local collidedObjects = self:checkObjectCollisions()
        self.y = self.y + 1

        -- reset X if new collided object
        if #collidedObjects > 0 then
            self.x = self.x + PLAYER_WALK_SPEED * dt
        end
    
       
    end
end

function Player:checkRightCollisions(dt)
   
   
    -- place player outside the X bounds on one of the tiles to reset any overlap
    if self.x == VIRTUAL_WIDTH - self.width then
        self.x = VIRTUAL_WIDTH - self.width
    else --just trying to add

        self.y = self.y - 1
        local collidedObjects = self:checkObjectCollisions()
        self.y = self.y + 1

        if #collidedObjects > 0 then
            self.x = self.x - PLAYER_WALK_SPEED * dt
        end
        
       
    end
end

function Player:checkObjectCollisions()
    local collidedObjects = {}
    
    for k, object in pairs(self.level.objects) do
        if object:collides(self) then
            if object.solid then
                object.onCollide(self)
                table.insert(collidedObjects, object)
            elseif object.consumable then
                object.onConsume(self)
                table.remove(self.level.objects, k)
            end
        end
    end
    
    return collidedObjects
end

