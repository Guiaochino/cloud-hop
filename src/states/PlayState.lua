PlayState = Class{__includes = BaseState}

function PlayState:init()
    self.tileMap = self.tileMap
    self.gravityOn = true
    self.gravityAmount = 1

    self.player = Player({
        x = VIRTUAL_WIDTH / 2, y = VIRTUAL_HEIGHT - 38 - 16,
        width = 32, height = 38,
        texture = 'shroomi',
        stateMachine = StateMachine {
            ['idle'] = function() return PlayerIdleState(self.player) end,
            ['walking'] = function() return PlayerWalkingState(self.player) end,
            ['jump'] = function() return PlayerJumpState(self.player, self.gravityAmount) end,
            ['falling'] = function() return PlayerFallingState(self.player, self.gravityAmount) end
        },
        self.TileMap
    })

    self.player:changeState('idle')

end

function PlayState:update(dt)

    -- update player and level
    self.player:update(dt)
    
end

function PlayState:render()
    love.graphics.push()
    Ground:render()
    self.player:render()
    love.graphics.pop()
end
