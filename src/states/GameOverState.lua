GameOverState = Class{__includes = BaseState}

function GameOverState:enter()
    
    quitButton = ButtonUI('QUIT', VIRTUAL_WIDTH / 2 - buttonWidth / 2, VIRTUAL_HEIGHT - (buttonHeight + 10),
                    buttonWidth, buttonHeight, 'title')
    retryButton = ButtonUI('RETRY', VIRTUAL_WIDTH / 2 - buttonWidth / 2, VIRTUAL_HEIGHT - (buttonHeight + 40),
                    buttonWidth, buttonHeight, 'play')
end

function GameOverState:update(dt)
    retryButton:update()
    quitButton:update()
end

function GameOverState:render()
    if highScore >= currentScore then
        highScore = highScore
    elseif currentScore >= score then
        highScore = currentScore
    end

    love.graphics.setFont(gFonts['small'])

    -- Render Buttons
    retryButton:render()
    quitButton:render()

    
    love.graphics.setColor(0, 0, 0, 1)

    -- Render Text Score and HIGHSCORE
    love.graphics.printf("SCORE : ".. currentScore, 1, (VIRTUAL_HEIGHT / 2) - 30, VIRTUAL_WIDTH, 'center')
    love.graphics.printf("HIGHSCORE : ".. highScore, 1, (VIRTUAL_HEIGHT / 2) - 10, VIRTUAL_WIDTH, 'center')
end
