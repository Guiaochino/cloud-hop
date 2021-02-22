require 'src/Dependencies'

function love.load()
    love.graphics.setDefaultFilter('nearest', 'nearest')
    love.graphics.setFont(gFonts['medium'])
    love.window.setTitle('Cloud Hop')

    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        vsync = true,
        fullscreen = false,
        resizable = true
    })

    gStateMachine = StateMachine{
        ['title'] = function() return TitleScreenState() end,
        ['play'] = function () return PlayState() end,
        ['settings'] = function() return SettingScreenState() end,
        ['changeAvatar'] = function() return ChangeScreenState() end,
        ['gameOver'] = function() return GameOverState() end
    }
    gStateMachine:change('title')

    love.keyboard.keysPressed = {}

    love.mouse.mousepressed = {}

    mousePosition = {['x'] = nil, ['y'] = nil}
end

function love.resize(w, h)
    push:resize(w, h)
end

function love.keypressed(key)
    love.keyboard.keysPressed[key] = true
end

function love.keyboard.wasPressed(key)
    if love.keyboard.keysPressed[key] then
        return true
    else
        return false
    end
end

function love.mousepressed(x, y, button, istoush, presses)
    love.mouse.mousepressed[button] = true
end

function love.update(dt)
    backgroundScroll = (backgroundScroll + BACKGROUND_SCROLL_SPEED * dt) % BACKGROUND_LOOPING_POINT
    
    mouseX = love.mouse.getX()
    mouseY = love.mouse.getY()

    mousePosition.x, mousePosition.y = push:toGame(mouseX, mouseY)

    gStateMachine:update(dt)

    love.mouse.mousepressed = {}

    love.keyboard.keysPressed = {}
end

function love.draw()
    push:start()

    -- Side Scrolling Background for shroomi
    love.graphics.draw(gTextures['sky'], -backgroundScroll, 0)


    gStateMachine:render()

    push:finish()
end

function distanceBetween(x1, y1)
    return math.sqrt((mousePosition.x - x1) ^ 2 + (mousePosition.y - y1) ^ 2)
end
