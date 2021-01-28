push = require 'lib/push'

Class = require 'lib/class'

require 'src/constants'

require 'src/StateMachine'

require 'src/states/BaseState'

-- require 'src/states/StartState'

require 'src/states/TitleScreenState'

gFonts = {
    ['small'] = love.graphics.newFont('fonts/ponde___.ttf', 8),
    ['medium'] = love.graphics.newFont('fonts/ponde___.ttf', 16),
    ['large'] = love.graphics.newFont('fonts/ponde___.ttf', 42),
    ['title'] = love.graphics.newFont('fonts/6809 chargen.ttf', 42)
}