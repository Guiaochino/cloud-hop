TitleScreenState = Class{__includes = BaseState}

function TitleScreenState:update(dt)
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('play')
    end
end

function TitleScreenState:render()
    love.graphics.setFont(gFonts['large'])
    love.graphics.setColor(0, 0, 0)
    love.graphics.printf("Cloud Hop", 0, VIRTUAL_HEIGHT / 3,
        VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(gFonts['medium'])
    love.graphics.printf("Press Enter to play", 0, 900, VIRTUAL_WIDTH, 'center')
end