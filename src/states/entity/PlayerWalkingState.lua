

PlayerWalkingState = Class{__includes = BaseState}

function PlayerWalkingState:init(player)
    self.player = player
    self.animation = Animation {
        frames = {1, 2},
        interval = 0.1
    }
    self.player.currentAnimation = self.animation
end

function PlayerWalkingState:update(dt)
    self.player.currentAnimation:update(dt)

    
    if not love.keyboard.isDown('left') and not love.keyboard.isDown('right') then
        self.player:changeState('idle')
    else
        
        -- temporarily shift player down a pixel to test for game objects beneath
        self.player.y = self.player.y + 1

        local collidedObjects = self.player:checkObjectCollisions()

        self.player.y = self.player.y - 1

        -- check to see whether there are any tiles beneath us
        
        if love.keyboard.isDown('left') then
            self.player.x = self.player.x - PLAYER_WALK_SPEED * dt
            self.player.direction = 'left'
            self.player:checkLeftCollisions(dt)
        elseif love.keyboard.isDown('right') then
            self.player.x = self.player.x + PLAYER_WALK_SPEED * dt
            self.player.direction = 'right'
            self.player:checkRightCollisions(dt)
        end
    end

    

    if love.keyboard.wasPressed('space') then
        self.player:changeState('jump')
    end
end
