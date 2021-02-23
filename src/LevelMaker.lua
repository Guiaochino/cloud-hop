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

    local isAlive = true
    local counter = 1

    local timer = 0

    local spawnDark = math.random(0, 2)
    
    for y = 1, height  do
        
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
                    if obj.hit then
                        player:changeState('idle')
                    end
                end
            })
    
    end

    

    for y = VIRTUAL_HEIGHT / 2, -height * 10, -1 do
        
        for x = 0, 2 do

            -- chance to Spawn Dark Clouds
            if math.random(10) == spawnDark then
                table.insert(objects, GameObject{
                    texture = 'dark_cloud',
                    x = x * (VIRTUAL_WIDTH / 3) + 8,
                    y = y * CLOUD_GAP,
                    width = 64,
                    height = 16,
                    collidable = true,
                    hit = true,
                    solid = true
                })

            --Chance to Spawn Ordinary Clouds
            elseif math.random(2) == x and spawnDark ~= x then
                table.insert(objects, GameObject{
                    texture = 'ordinary_cloud',
                    x = x * (VIRTUAL_WIDTH / 3) + 8,
                    y = y * CLOUD_GAP,
                    width = 64,
                    height = 16, 
                    collidable = true,
                    solid = true,

                    onCollide = function(obj)
                        player:changeState('idle')
                    end
                })
            end
        end

    end

    return GameLevel(entities, objects)
end
