TitleScreenState = Class{__includes = BaseState}

function TitleScreenState:enter()
    settings = Icon(ICON_DEFS['setting'].texture, ICON_DEFS['setting'].x, ICON_DEFS['setting'].y,
                ICON_DEFS['setting'].width, ICON_DEFS['setting'].height)
    
    change_avatar = Icon(ICON_DEFS['change-avatar'].texture, ICON_DEFS['change-avatar'].x, ICON_DEFS['change-avatar'].y,
                    ICON_DEFS['change-avatar'].width, ICON_DEFS['change-avatar'].height)
    
    basket = Icon(ICON_DEFS['basket'].texture, ICON_DEFS['basket'].x, ICON_DEFS['basket'].y, ICON_DEFS['basket'].width,
                ICON_DEFS['basket'].height)
end

function TitleScreenState:update(dt)

    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('play')
        
    elseif love.keyboard.wasPressed('escape') then
        love.event.quit()

    elseif love.keyboard.wasPressed('s') or love.keyboard.wasPressed('S') or distanceBetween(settings.x, settings.y) < ICON_SIZE and love.mouse.isDown(1) then
        gStateMachine:change('settings')

    elseif love.keyboard.wasPressed('c') or love.keyboard.wasPressed('C') or distanceBetween(change_avatar.x, change_avatar.y) < ICON_SIZE and love.mouse.isDown(1) then
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
    settings:render()
    basket:render()
    change_avatar:render()

    --Dispplay highest score achieved
    love.graphics.setFont(gFonts['medium'])
    love.graphics.setColor(0, 0, 0, 1)
    love.graphics.printf("HIGHSCORE : 0", 1, (VIRTUAL_HEIGHT / 2) - 10, VIRTUAL_WIDTH, 'center')

    -- Let the user know how to start the game
    love.graphics.setFont(gFonts['small'])
    love.graphics.setColor(0, 0, 0, 1)
    love.graphics.printf("Press \"Enter\" to Start the Game", 1, (VIRTUAL_HEIGHT / 2) + 20, VIRTUAL_WIDTH, 'center')
    
    --love.graphics.print(mouse)
    love.graphics.printf("Press \"S\" to go to Settings", 1, (VIRTUAL_HEIGHT / 2) + 80, VIRTUAL_WIDTH, 'center')
    love.graphics.printf("Press \"C\" to change Character", 1, (VIRTUAL_HEIGHT / 2) + 90, VIRTUAL_WIDTH, 'center')
    love.graphics.printf("Press \"Esc\" to Quit the Game", 1, (VIRTUAL_HEIGHT / 2) + 100, VIRTUAL_WIDTH, 'center')

end
