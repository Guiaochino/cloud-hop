


PlayerJumpState = Class{__includes = BaseState}

function PlayerJumpState:init(player, gravity)
    self.player = player
    self.gravity = gravity
    self.animation = Animation {
        frames = {4},
        interval = 1
    }
    self.player.currentAnimation = self.animation
end

function PlayerJumpState:enter(params)
    gAudio['jump']:play()
    self.player.dy = PLAYER_JUMP_VELOCITY
end

function PlayerJumpState:update(dt)
    self.player.currentAnimation:update(dt)
    self.player.dy = self.player.dy + self.gravity
    self.player.y = self.player.y + (self.player.dy * dt)

    -- go into the falling state when y velocity is positive
    if self.player.dy >= 0 then
        self.player:changeState('falling')
        self.player.y = self.player.y + (self.player.dy * dt)
    -- else test our sides for blocks
    elseif love.keyboard.isDown('left') then
        self.player.direction = 'left'
        self.player.x = math.max(2, self.player.x - PLAYER_WALK_SPEED * dt)
        --self.player:checkObjectCollisions()
        self.player:checkLeftCollisions(dt)
    elseif love.keyboard.isDown('right') then
        self.player.direction = 'right'
        self.player.x = math.min(VIRTUAL_WIDTH - 20, self.player.x + PLAYER_WALK_SPEED * dt)
        --self.player:checkObjectCollisions()
        self.player:checkRightCollisions(dt)
    end
end
