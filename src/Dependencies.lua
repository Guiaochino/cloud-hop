push = require 'lib/push'

Class = require 'lib/class'

require 'src/constants'

require 'src/StateMachine'

require 'src/states/BaseState'

require 'src/states/StartState'

require 'src/states/PlayState'

require 'src/states/TitleScreenState'

-- general
require 'src/Animation'
require 'src/Clouds'
require 'src/Entity'
require 'src/GameObject'
require 'src/GameLevel'
require 'src/LevelMaker'
require 'src/Player'
require 'src/Tile'
require 'src/TileMap'
require 'src/Util'



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
    ['ground'] = love.graphics.newImage('graphics/ground.png')
}

gFrames = {
    ['tiles'] = GenerateQuads(gTextures['tiles'], TILE_SIZE, TILE_SIZE),
    ['sky'] = GenerateQuads(gTextures['sky'], 240, 320),
    ['shroomi'] = GenerateQuads(gTextures['shroomi'], 32, 38)
}
