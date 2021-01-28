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
require 'src/Entity'
require 'src/Player'
require 'src/Tile'
require 'src/TileMap'
require 'src/Util'
require 'src/Ground'

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
    ['toppers'] = love.graphics.newImage('graphics/Environment/tile_tops.png'),
    ['clouds'] = love.graphics.newImage('graphics/Environment/clouds.png'),
    ['shroomi'] = love.graphics.newImage('graphics/shroomi.png')
}

gFrames = {
    ['tiles'] = GenerateQuads(gTextures['tiles'], TILE_SIZE, TILE_SIZE),
    ['toppers'] = GenerateQuads(gTextures['toppers'], TILE_SIZE, TILE_SIZE),
    ['clouds'] = GenerateQuads(gTextures['clouds'], 64, 16),
    ['shroomi'] = GenerateQuads(gTextures['shroomi'], 32, 38)
}

gFrames['tilesets'] = GenerateTileSets(gFrames['tiles'], 
    TILE_SETS_WIDE, TILE_SETS_TALL, TILE_SET_WIDTH, TILE_SET_HEIGHT)

gFrames['toppersets'] = GenerateTileSets(gFrames['toppers'], 
    TOPPER_SETS_WIDE, TOPPER_SETS_TALL, TILE_SET_WIDTH, TILE_SET_HEIGHT)
