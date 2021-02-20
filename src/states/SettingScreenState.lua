SettingScreenState = Class{__includes = BaseState}

function SettingScreenState:update(dt)
    --mouse update
    local x, y = love.mouse.getPosition()

    if (x < 75 and y < 43) then
        if (love.mouse.isDown(1)) then
            gStateMachine:change('title')
        end
    end
    
    
    if love.keyboard.wasPressed('escape') then
        gStateMachine:change('title')
    end
end

function SettingScreenState:render()
    -- Back button 
    love.graphics.draw(gTextures['back'], 5, 0)

    -- Design for UI goes here
    love.graphics.setColor(0, 0, 0, 0.5)
    love.graphics.rectangle('fill', 10, 36 , VIRTUAL_WIDTH - 20, VIRTUAL_HEIGHT - 46, 30, 30)
    love.graphics.setColor(0, 0, 0, 1)
    love.graphics.rectangle('line', 10, 36 , VIRTUAL_WIDTH - 20, VIRTUAL_HEIGHT - 46, 30, 30)
    love.graphics.rectangle('line', 10, 36 , VIRTUAL_WIDTH - 20, VIRTUAL_HEIGHT - 46, 30, 30)
    love.graphics.rectangle('line', 10, 36 , VIRTUAL_WIDTH - 20, VIRTUAL_HEIGHT - 46, 30, 30)

    -- Display Audio and SFX for Silent
    -- Checkboxes
    love.graphics.rectangle('line', 50, 36 * 2, 10, 10)
    love.graphics.rectangle('line', 50, 36 + (36 * 2), 10, 10)

    -- Display text
    love.graphics.setFont(gFonts['medium'])
    love.graphics.printf("Audio", 2, VIRTUAL_HEIGHT / 2 - 90, VIRTUAL_WIDTH, 'center')
    love.graphics.printf("SFX", 2, VIRTUAL_HEIGHT / 2 - 55, VIRTUAL_WIDTH, 'center')

    --Display Highscore
    love.graphics.setFont(gFonts['small'])
    love.graphics.printf("HIGHSCORE : 0", 1, (VIRTUAL_HEIGHT / 2) - 10, VIRTUAL_WIDTH, 'center')

    -- Display button
    love.graphics.rectangle('line', 20, VIRTUAL_HEIGHT - 76, VIRTUAL_WIDTH - 40, 46, 15, 15)
    love.graphics.rectangle('line', 20, VIRTUAL_HEIGHT - 76, VIRTUAL_WIDTH - 40, 46, 15, 15)
    love.graphics.rectangle('line', 20, VIRTUAL_HEIGHT - 76, VIRTUAL_WIDTH - 40, 46, 15, 15)
    love.graphics.setFont(gFonts['medium'])
    love.graphics.printf("QUIT", 2, VIRTUAL_HEIGHT - 60, VIRTUAL_WIDTH, 'center')
end
