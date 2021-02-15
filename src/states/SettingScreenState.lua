SettingScreenState = Class{__includes = BaseState}

function SettingScreenState:update(dt)
    
end

function SettingScreenState:render()
    -- Back button 
    love.graphics.draw(gTextures['back'], 0, 0)

    -- Design for UI goes here
    love.graphics.rectange('line', VIRTUAL_WIDTH / 2, VIRTUAL_HEIGHT / 2, VIRTUAL_WIDTH, VIRTUAL_HEIGHT)
end