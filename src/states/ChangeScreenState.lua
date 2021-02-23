ChangeScreenState = Class{__includes = BaseState}

function ChangeScreenState:enter()
    back = Icon(ICON_DEFS['back'].texture, ICON_DEFS['back'].x, ICON_DEFS['back'].y, ICON_DEFS['back'].width,
            ICON_DEFS['back'].height, ICON_DEFS['back'].toState)

    basket = Icon(ICON_DEFS['basket'].texture, ICON_DEFS['basket'].x, 0, ICON_DEFS['basket'].width,
                ICON_DEFS['basket'].height)
end

function ChangeScreenState:update(dt)

    back:update()

    if love.keyboard.wasPressed('escape') then
        gStateMachine:change('title')
    end
end

function ChangeScreenState:render()

    back:render()
    basket:render()

    love.graphics.setColor(0, 0, 0, 1)
    love.graphics.setFont(gFonts["small"])
    love.graphics.printf("Ongoing Progress", 1, VIRTUAL_HEIGHT / 2, VIRTUAL_WIDTH, 'center')
    love.graphics.printf("Press \"Esc\" to go back", 1, VIRTUAL_HEIGHT / 2 + 10, VIRTUAL_WIDTH, 'center')
end