ChangeScreenState = Class{__includes = BaseState}

function ChangeScreenState:update()
    if love.keyboard.wasPressed('escape') then
        gStateMachine:change('title')
    end
end

function ChangeScreenState:render()
    love.graphics.setColor(0, 0, 0, 1)
    love.graphics.setFont(gFonts["small"])
    love.graphics.printf("Ongoing Progress", 1, VIRTUAL_HEIGHT / 2, VIRTUAL_WIDTH, 'center')
    love.graphics.printf("Press \"Esc\" to go back", 1, VIRTUAL_HEIGHT / 2 + 10, VIRTUAL_WIDTH, 'center')
end