

PlayerFallingState = Class{__includes = BaseState}

function PlayerFallingState:init(player, gravity)
    self.player = player
    self.gravity = gravity
    self.animation = Animation {
        frames = {1},
        interval = 0.1
    }
    self.player.currentAnimation = self.animation
end

function PlayerFallingState:update(dt)
    self.player.currentAnimation:update(dt)
    self.player.dy = self.player.dy + self.gravity
    self.player.y = self.player.y + (self.player.dy * dt)
    
    if self.player.dy > 350  then
        gAudio['death-fall']:play()
        gStateMachine:change('gameOver')
        currentScore = score
    elseif love.keyboard.isDown('left') then
        self.player.direction = 'left'
        self.player.x = math.max(2, self.player.x - PLAYER_WALK_SPEED * dt)
        self.player:checkLeftCollisions(dt)
    elseif love.keyboard.isDown('right') then
        self.player.direction = 'right'
        self.player.x = math.min(VIRTUAL_WIDTH - 20, self.player.x + PLAYER_WALK_SPEED * dt)
        self.player:checkRightCollisions(dt)
    end

    for k, object in pairs(self.player.level.objects) do
        if object:collides(self.player) then
            if object.solid then
                self.player.dy = 0
                self.player.y = object.y - self.player.height
                
                --self.player:changeState('idle')
                if love.keyboard.isDown('left') or love.keyboard.isDown('right') then
                    self.player:changeState('walking')
                else
                    self.player:changeState('idle')
                end
            elseif object.consumable then
                object.onConsume(self.player)
                table.remove(self.player.level.objects, k)
            end
        end
    end

end
