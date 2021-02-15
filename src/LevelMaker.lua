--[[
    GD50
    Super Mario Bros. Remake

    -- LevelMaker Class --

    Author: Colton Ogden
    cogden@cs50.harvard.edu
]]

LevelMaker = Class{}

function LevelMaker.generate(width, height)
    local entities = {}
    local objects = {}
    
    for y = 1, height do
        
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

        if math.random(80) == 1 then
            table.insert(objects,
                GameObject {
                texture = 'whiteC',
                x = math.random(64, VIRTUAL_WIDTH - 64),
                y = math.random(1, 230),
                width = 64,
                height = 16,
                collidable = true,
                hit = true,
                solid = true
                }
            )

            table.insert(objects,
                GameObject {
                texture = 'darkC',
                x = math.random(64, VIRTUAL_WIDTH - 64),
                y = math.random(1, 230),
                width = 64,
                height = 16,
                collidable = true,
                hit = true,
                solid = true
                }
            )

            table.insert(objects,
                GameObject {
                texture = 'thunderC',
                x = math.random(64, VIRTUAL_WIDTH - 64),
                y = math.random(1, 230),
                width = 64,
                height = 16,
                collidable = true,
                hit = true,
                solid = true
                }
            )
        end
    end

    return GameLevel(entities, objects)
end
