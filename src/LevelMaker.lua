--[[
    GD50
    Super Mario Bros. Remake

    -- LevelMaker Class --

    Author: Colton Ogden
    cogden@cs50.harvard.edu
]]

LevelMaker = Class{}

hasKey = false

function LevelMaker.generate(width, height)
    local entities = {}
    local objects = {}

    table.insert(objects,
        GameObject {
            texture = 'ground',
            x = 0,
            y = VIRTUAL_HEIGHT - 40,
            width = 240,
            height = 40,
            collidable = true,
            hit = true,
            solid = true,

            onCollide = function (obj)
                player:changeState('idle')
            end
        }
    )

    return GameLevel(entities, objects)
end