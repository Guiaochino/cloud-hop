

PlayerFallingState = Class{__includes = BaseState}

function PlayerFallingState:init(player, gravity)
    self.player = player
    self.gravity = gravity
    self.animation = Animation {
        frames = {5},
        interval = 1
    }
    self.player.currentAnimation = self.animation
end

function PlayerFallingState:update(dt)
    self.player.currentAnimation:update(dt)
    self.player.dy = self.player.dy + self.gravity
    self.player.y = self.player.y + (self.player.dy * dt)

  
    -- if we get a collision beneath us, go into either walking or idle
    if (tileBottomLeft and tileBottomRight) and (tileBottomLeft:collidable() or tileBottomRight:collidable()) then
        self.player.dy = 0
        
        -- set the player to be walking or idle on landing depending on input
        if love.keyboard.isDown('left') or love.keyboard.isDown('right') then
            self.player:changeState('walking')
        else
            self.player:changeState('idle')
        end

        self.player.y = (tileBottomLeft.y - 1) * TILE_SIZE - self.player.height
     -- check side collisions and reset position
    elseif love.keyboard.isDown('left') then
        self.player.direction = 'left'
        self.player.x = self.player.x - PLAYER_WALK_SPEED * dt
        self.player:checkLeftCollisions(dt)
    elseif love.keyboard.isDown('right') then
        self.player.direction = 'right'
        self.player.x = self.player.x + PLAYER_WALK_SPEED * dt
        self.player:checkRightCollisions(dt)
    elseif love.keyboard.wasPressed('space') then
        self.player:changeState('jump')
    end
end
