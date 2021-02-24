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
    
    love.graphics.setFont(gFonts['medium'])
    love.graphics.setColor(0, 0, 0)
    love.graphics.printf(score, 1, 10, VIRTUAL_WIDTH, 'center')
end

function PlayState:updateCamera()
    
    if self.player.y >= VIRTUAL_HEIGHT/2 then
        self.camY = 0
    elseif self.player.y < VIRTUAL_HEIGHT/2 then
        self.camY = -(VIRTUAL_HEIGHT / 2 - self.player.y)
    end

end
