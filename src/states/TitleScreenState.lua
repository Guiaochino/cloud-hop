TitleScreenState = Class{__includes = BaseState}

function TitleScreenState:update(dt)
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('play')
    
    elseif love.keyboard.wasPressed('escape') then
        love.event.quit()

    elseif love.keyboard.wasPressed('s') or love.keyboard.wasPressed('S') then
        gStateMachine:change('settings')

    elseif love.keyboard.wasPressed('c') or love.keyboard.wasPressed('C') then
        gStateMachine:change('changeAvatar')
    end
end

function TitleScreenState:render()
    -- Title of the game
    love.graphics.setFont(gFonts['title'])
    love.graphics.setColor(0, 0, 0, 1)
    love.graphics.printf("Cloud Hop", 1, VIRTUAL_HEIGHT / 2 - 70 + 1, VIRTUAL_WIDTH, 'center')
    love.graphics.printf("Cloud Hop", 1, VIRTUAL_HEIGHT / 2 - 70 - 1, VIRTUAL_WIDTH, 'center')
    love.graphics.printf("Cloud Hop", 0, VIRTUAL_HEIGHT / 2 - 70, VIRTUAL_WIDTH, 'center')
    love.graphics.printf("Cloud Hop", 2, VIRTUAL_HEIGHT / 2 - 70, VIRTUAL_WIDTH, 'center')
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.printf("Cloud Hop", 1, VIRTUAL_HEIGHT / 2 - 70, VIRTUAL_WIDTH, 'center')

    -- Overlay the icons at the top of the layer
    love.graphics.draw(gTextures['setting'], 0, 0)
    love.graphics.draw(gTextures['basket'], VIRTUAL_WIDTH - 34, 2)
    love.graphics.draw(gTextures['change-avatar'], VIRTUAL_WIDTH - 36, VIRTUAL_HEIGHT - 36)

    --Dispplay highest score achieved
    love.graphics.setFont(gFonts['medium'])
    love.graphics.setColor(0, 0, 0, 1)
    love.graphics.printf("HIGHSCORE : 0", 1, (VIRTUAL_HEIGHT / 2) - 10, VIRTUAL_WIDTH, 'center')

    -- Let the user know how to start the game
    love.graphics.setFont(gFonts['small'])
    love.graphics.setColor(0, 0, 0, 1)
    love.graphics.printf("Press \"Enter\" to Start the Game", 1, (VIRTUAL_HEIGHT / 2) + 20, VIRTUAL_WIDTH, 'center')

end