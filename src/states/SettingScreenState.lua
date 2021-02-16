SettingScreenState = Class{__includes = BaseState}

function SettingScreenState:update(dt)
    
end

function SettingScreenState:render()
    -- Back button 
    love.graphics.draw(gTextures['back'], 5, 0)

    -- Design for UI goes here
    love.graphics.setColor(0, 0, 0, 0.5)
    love.graphics.rectangle('fill', 10, 36 , VIRTUAL_WIDTH - 20, VIRTUAL_HEIGHT - 46)
    love.graphics.setColor(0, 0, 0, 1)
    love.graphics.rectangle('line', 10, 36 , VIRTUAL_WIDTH - 20, VIRTUAL_HEIGHT - 46)
    love.graphics.rectangle('line', 10, 36 , VIRTUAL_WIDTH - 20, VIRTUAL_HEIGHT - 46)
    love.graphics.rectangle('line', 10, 36 , VIRTUAL_WIDTH - 20, VIRTUAL_HEIGHT - 46)

    -- Display Audio and SFX for Silent
end