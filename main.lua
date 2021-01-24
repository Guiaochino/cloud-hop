require 'src/Dependencies'

local background = love.graphics.newImage('graphics/Environment/background_temp.png')
local backgroundScroll = 0
local BACKGROUND_SCROLL_SPEED = 100

-- change when the bg changed
local BACKGROUND_LOOPING_POINT = 4200


function love.load()
    love.graphics.setDefaultFilter('nearest', 'nearest')

    love.window.setTitle('Cloud Hop')

    gFonts = {
        ['small'] = love.graphics.newFont('fonts/Roboto-Black.ttf', 48),
        ['medium'] = love.graphics.newFont('fonts/Roboto-Black.ttf', 72),
        ['large'] = love.graphics.newFont('fonts/Roboto-Black.ttf', 128)
    }

    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        vsync = true,
        fullscreen = false,
        resizable = true
    })

    gStateMachine = StateMachine{
        ['title'] = function() return TitleScreenState() end,
        ['play'] = function () return PlayState() end
    }
    gStateMachine:change('title')

    love.keyboard.keysPressed = {}
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

function love.update(dt)
    backgroundScroll = (backgroundScroll - BACKGROUND_SCROLL_SPEED * dt) % BACKGROUND_LOOPING_POINT
    
    gStateMachine:update(dt)

    love.keyboard.keysPressed = {}
end

function love.draw()
    push:start()

    love.graphics.draw(background, 0, -backgroundScroll)

    gStateMachine:render()

    push:finish()
end
