push = require 'lib/push'

Class = require 'lib/class'

Timer = require 'lib/knife/timer'

require 'src/constants'

-- State Machines
require 'src/StateMachine'
require 'src/states/BaseState'
require 'src/states/StartState'
require 'src/states/PlayState'
require 'src/states/TitleScreenState'
require 'src/states/SettingScreenState'
require 'src/states/ChangeScreenState'
require 'src/states/GameOverState'

-- general
require 'src/Animation'
-- require 'src/Clouds'
require 'src/Entity'
require 'src/GameObject'
require 'src/GameLevel'
require 'src/LevelMaker'
require 'src/Player'
require 'src/Tile'
require 'src/TileMap'
require 'src/Util'

-- UI
require 'src/UI/icons'
require 'src/UI/Icon'
require 'src/UI/ButtonUI'
require 'src/UI/Checkbox'

-- entity states
require 'src/states/entity/PlayerFallingState'
require 'src/states/entity/PlayerIdleState'
require 'src/states/entity/PlayerJumpState'
require 'src/states/entity/PlayerWalkingState'

gFonts = {
    ['small'] = love.graphics.newFont('fonts/ponde___.ttf', 8),
    ['medium'] = love.graphics.newFont('fonts/ponde___.ttf', 16),
    ['large'] = love.graphics.newFont('fonts/ponde___.ttf', 42),
    ['title'] = love.graphics.newFont('fonts/6809 chargen.ttf', 42)
}

gTextures = {
    ['tiles'] = love.graphics.newImage('graphics/Environment/tiles.png'),
    ['shroomi'] = love.graphics.newImage('graphics/shroomi.png'),
    ['sky'] = love.graphics.newImage('graphics/cloud-bg-colored.png'),
    ['ground'] = love.graphics.newImage('graphics/ground.png'),
    ['ordinary_cloud'] = love.graphics.newImage('graphics/cloud1.png'),
    ['dark_cloud'] = love.graphics.newImage('graphics/cloud2.png'),
    ['thunder_cloud'] = love.graphics.newImage('graphics/cloud3.png'),
    
    -- fruits
    ['apple'] = love.graphics.newImage('graphics/Fruits/apple.png'),
    ['banana'] = love.graphics.newImage('graphics/Fruits/banana.png'),
    ['berry'] = love.graphics.newImage('graphics/Fruits/berry.png'),
    ['coco'] = love.graphics.newImage('graphics/Fruits/coco.png'),
    ['grapes'] = love.graphics.newImage('graphics/Fruits/grapes.png'),
    ['kiwi'] = love.graphics.newImage('graphics/Fruits/kiwi.png'),
    ['orange'] = love.graphics.newImage('graphics/Fruits/orange.png'),

    -- textures for icons for TitleScreenState
    ['setting'] = love.graphics.newImage('graphics/icons/settings-icon.png'),
    ['basket'] = love.graphics.newImage('graphics/icons/basket-icon.png'),
    ['change-avatar'] = love.graphics.newImage('graphics/icons/change_avatar-icon.png'),
    ['back'] = love.graphics.newImage('graphics/icons/back-icon.png')
}

gFrames = {
    ['tiles'] = GenerateQuads(gTextures['tiles'], TILE_SIZE, TILE_SIZE),
    ['shroomi'] = GenerateQuads(gTextures['shroomi'], 32, 38)
}

gAudio = {
    ['main'] = love.audio.newSource('sounds/main-background-music.wav', 'static'),
    ['jump'] = love.audio.newSource('sounds/bounce-3.wav', 'static'),
    ['collect'] = love.audio.newSource('sounds/collect-3.wav', 'static'),
    ['game-over'] = love.audio.newSource('sounds/electricshock.wav', 'static')
}
