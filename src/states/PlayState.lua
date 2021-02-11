PlayState = Class{__includes = BaseState}

function PlayState:init()
    self.tileMap = self.tileMap
    self.gravityOn = true
    self.gravityAmount = 1
    self.camX = 0
    self.camY = 0
    self.level = LevelMaker.generate(10, 100)
    self.backgroundY = 0
   
    self.player = Player({
        x = VIRTUAL_WIDTH / 2, y = VIRTUAL_HEIGHT - 38 - 40,
        width = 32, height = 38,
        texture = 'shroomi',
        stateMachine = StateMachine {
            ['idle'] = function() return PlayerIdleState(self.player) end,
            ['walking'] = function() return PlayerWalkingState(self.player) end,
            ['jump'] = function() return PlayerJumpState(self.player, self.gravityAmount) end,
            ['falling'] = function() return PlayerFallingState(self.player, self.gravityAmount) end
        },
        level = self.level
    })

    self.player:changeState('idle')

end

function PlayState:update(dt)
    self.level:clear()
    -- update player and level
    self.player:update(dt)
    self.level:update(dt)
    self:updateCamera()
    
end

function PlayState:render()
    love.graphics.push()
    -- Clouds:render()
    love.graphics.translate(-math.floor(self.camX), -math.floor(self.camY))
    self.level:render()
    self.player:render()
    love.graphics.pop()
end

function PlayState:updateCamera()
    self.camY = math.max(0,
        math.min(16 - VIRTUAL_WIDTH,
        self.player.y - (VIRTUAL_HEIGHT / 2 - 8)))
    self.backgroundY = (self.camY / 3) % 256
end
