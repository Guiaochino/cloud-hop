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
    
    local tryChance = math.random(VIRTUAL_WIDTH / 2, -height * 10)
    
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

    

    for y = VIRTUAL_HEIGHT / 3, -height * 10, -1.5 do
        
        for x = 0, 2 do

            -- chance to Spawn Dark Clouds
            if math.random(12) == 1 then
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
            elseif spawnDark ~= x and tryChance ~= y then
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
    
    for y = 250, -height * 10, -2 do
        for x = 0, 7 do
            if math.random(50) == 1 then
                table.insert(objects, GameObject{
                    texture = 'apple',
                    x = x * (VIRTUAL_WIDTH / 7) + 8,
                    y = y * CLOUD_GAP + 10,
                    width = 24,
                    height = 24,
                    collidable = true,
                    hit = true,
                    consumable = true,

                    onConsume = function(obj)
                        table.remove(obj)
                        score = score + 1
                    end

                })
            elseif math.random(50) == 2 then
                table.insert(objects, GameObject{
                    texture = 'banana',
                    x = x * (VIRTUAL_WIDTH / 7) + 8,
                    y = y * CLOUD_GAP + 10,
                    width = 24,
                    height = 24,
                    collidable = true,
                    hit = true,
                    consumable = true,

                    onConsume = function(obj)
                        table.remove(obj)
                        score = score + 2
                    end

                })
            elseif math.random(50) == 3 then
                table.insert(objects, GameObject{
                    texture = 'berry',
                    x = x * (VIRTUAL_WIDTH / 7) + 8,
                    y = y * CLOUD_GAP + 10,
                    width = 24,
                    height = 24,
                    collidable = true,
                    hit = true,
                    consumable = true,

                    onConsume = function(obj)
                        table.remove(obj)
                        score = score + 5
                    end
                    
                })
            elseif math.random(50) == 4 then
                table.insert(objects, GameObject{
                    texture = 'coco',
                    x = x * (VIRTUAL_WIDTH / 7) + 8,
                    y = y * CLOUD_GAP + 10,
                    width = 24,
                    height = 24,
                    collidable = true,
                    hit = true,
                    consumable = true,

                    onConsume = function(obj)
                        table.remove(obj)
                        score = score + 3
                    end
                    
                })
            elseif math.random(50) == 5 then
                table.insert(objects, GameObject{
                    texture = 'grapes',
                    x = x * (VIRTUAL_WIDTH / 7) + 8,
                    y = y * CLOUD_GAP + 10,
                    width = 24,
                    height = 24,
                    collidable = true,
                    hit = true,
                    consumable = true,

                    onConsume = function(obj)
                        table.remove(obj)
                        score = score + 3
                    end
                    
                })
            elseif math.random(50) == 6 then
                table.insert(objects, GameObject{
                    texture = 'kiwi',
                    x = x * (VIRTUAL_WIDTH / 7) + 8,
                    y = y * CLOUD_GAP + 10,
                    width = 24,
                    height = 24,
                    collidable = true,
                    hit = true,
                    consumable = true,

                    onConsume = function(obj)
                        table.remove(obj)
                        score = score + 5
                    end
                    
                })
            elseif math.random(50) == 7 then
                table.insert(objects, GameObject{
                    texture = 'orange',
                    x = x * (VIRTUAL_WIDTH / 7) + 8,
                    y = y * CLOUD_GAP + 10,
                    width = 24,
                    height = 24,
                    collidable = true,
                    hit = true,
                    consumable = true,

                    onConsume = function(obj)
                        table.remove(obj)
                        score = score + 1
                    end
                    
                })
            end
        end
    end

    return GameLevel(entities, objects)
end
