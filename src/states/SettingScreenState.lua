SettingScreenState = Class{__includes = BaseState}

function SettingScreenState:enter()
    back = Icon(ICON_DEFS['back'].texture, ICON_DEFS['back'].x, ICON_DEFS['back'].y, ICON_DEFS['back'].width,
            ICON_DEFS['back'].height, ICON_DEFS['back'].toState)

    buttonWidth = VIRTUAL_WIDTH - 100
    buttonHeight = 20
    quitButton = ButtonUI('QUIT', VIRTUAL_WIDTH / 2 - buttonWidth / 2, VIRTUAL_HEIGHT - (buttonHeight + 10), buttonWidth, buttonHeight)
    
    audioControl = Checkbox('AUDIO', VIRTUAL_WIDTH / 2, VIRTUAL_HEIGHT / 2)
end

function SettingScreenState:update(dt)

    back:update()
    audioControl:update()
    quitButton:update()
    
    if love.keyboard.wasPressed('escape') then
        gStateMachine:change('title')
    end
end

function SettingScreenState:render()
    -- Back button 
    back:render()

    audioControl:render()

    -- Render UI here
    quitButton:render()

    love.graphics.setColor(0, 0, 0, 1)
    love.graphics.printf("HIGHSCORE : 0", 1, (VIRTUAL_HEIGHT / 2) - 10, VIRTUAL_WIDTH, 'center')

end

