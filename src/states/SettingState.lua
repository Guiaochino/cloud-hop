SettingState = Class{__includes = BaseState}

function SettingState:update(dt)
    
end

function SettingState:render()
    love.graphics.draw(gTextures['back'], 0, 0)
end