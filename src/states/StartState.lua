StartState = Class{__includes = BaseState}

local highlighted = 1

function StartState:update(dt)
    if love.keyboard.wasPressed('up') or love.keyboard.wasPressed('down') then
        highlighted = highlighted == 1 and 2 or 1
    end

    if love.keyboard.wasPressed('escape') then
        love.event.quit()
    end
end

function StartState:render()

    love.graphics.setFont(gFonts['large'])
    love.graphics.setColor(0, 0, 0)
    love.graphics.printf("Cloud Hop", 0, VIRTUAL_HEIGHT / 3,
        VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(gFonts['medium'])
    love.graphics.setColor(0, 0, 0)
    if highlighted == 1 then
        love.graphics.setColor(103, 255, 255, 255)
    end
    love.graphics.printf("START", 0, VIRTUAL_HEIGHT / 2 + 70,
        VIRTUAL_WIDTH, 'center')

    love.graphics.setColor(0, 0, 0)
    if highlighted == 2 then
        love.graphics.setColor(103, 255, 255, 255)
    end
    love.graphics.printf("HIGH SCORES", 0, VIRTUAL_HEIGHT / 2 + 150,
        VIRTUAL_WIDTH, 'center')

    love.graphics.setColor(0, 0, 0)
end