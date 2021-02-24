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

    local generateEnd = height * 10

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

    for y = VIRTUAL_WIDTH / 3, -height * 10, -1.5 do

        local spawnDark = math.random(0 , 2) or 1
        
        for x = 0, 2 do

            -- chance to Spawn Dark Clouds
            if math.random(10) == spawnDark then
                table.insert(objects, GameObject{
                    texture = 'dark_cloud',
                    x = x * (VIRTUAL_WIDTH / 3) + 8,
                    y = y * CLOUD_GAP,
                    width = 60,
                    height = 10,
                    collidable = true,
                    hit = true,
                    solid = true,

                    onCollide = function(obj)
                        gAudio['game-over']:play()
                        gStateMachine:change('gameOver')
                        currentScore = score
                        
                    end
                        
                })
            -- math.random(1, 3) == x and spawnDark ~= x and damn ~= y
            --Chance to Spawn Ordinary Clouds
            elseif math.random(3) ~= x and x ~= spawnDark then
                table.insert(objects, GameObject{
                    texture = 'ordinary_cloud',
                    x = math.random(0, 2) * (VIRTUAL_WIDTH / 3) + 8,
                    y = y * CLOUD_GAP,
                    width = 60,
                    height = 10,
                    collidable = true,
                    hit = false,
                    solid = true,

                    onCollide = function ()
                        
                    end
                })

            elseif math.random(7) == 1 then
                table.insert(objects, GameObject{
                    x = x * (VIRTUAL_WIDTH / 3) + 24,
                    y = y * CLOUD_GAP - 20,
                    texture = 'apple',
                    width = 24,
                    height = 24,
                    collidable = true,
                    hit = true,
                    consumable = true,
                
                    onConsume = function(obj)
                        gAudio['collect']:play()
                        table.remove(obj)
                        score = score + 1
                    end
                })
            
            elseif math.random(7) == 2 then
                table.insert(objects, GameObject{
                    texture = 'banana',
                    x = x * (VIRTUAL_WIDTH / 3) + 24,
                    y = y * CLOUD_GAP - 20,
                    width = 24,
                    height = 24,
                    collidable = true,
                    hit = true,
                    consumable = true,

                    onConsume = function(obj)
                        gAudio['collect']:play()
                        table.remove(obj)
                        score = score + 2
                    end

                })
            elseif math.random(7) == 3 then
                table.insert(objects, GameObject{
                    texture = 'berry',
                    x = x * (VIRTUAL_WIDTH / 3) + 24,
                    y = y * CLOUD_GAP - 20,
                    width = 24,
                    height = 24,
                    collidable = true,
                    hit = true,
                    consumable = true,

                    onConsume = function(obj)
                        gAudio['collect']:play()
                        table.remove(obj)
                        score = score + 5
                    end
                    
                })
            elseif math.random(7) == 4 then
                table.insert(objects, GameObject{
                    texture = 'coco',
                    x = x * (VIRTUAL_WIDTH / 3) + 24,
                    y = y * CLOUD_GAP - 20,
                    width = 24,
                    height = 24,
                    collidable = true,
                    hit = true,
                    consumable = true,

                    onConsume = function(obj)
                        gAudio['collect']:play()
                        table.remove(obj)
                        score = score + 3
                    end
                    
                })
            elseif math.random(7) == 5 then
                table.insert(objects, GameObject{
                    texture = 'grapes',
                    x = x * (VIRTUAL_WIDTH / 3) + 24,
                    y = y * CLOUD_GAP - 20,
                    width = 24,
                    height = 24,
                    collidable = true,
                    hit = true,
                    consumable = true,

                    onConsume = function(obj)
                        gAudio['collect']:play()
                        table.remove(obj)
                        score = score + 3
                    end
                    
                })
            elseif math.random(7) == 6 then
                table.insert(objects, GameObject{
                    texture = 'kiwi',
                    x = x * (VIRTUAL_WIDTH / 3) + 24,
                    y = y * CLOUD_GAP - 20,
                    width = 24,
                    height = 24,
                    collidable = true,
                    hit = true,
                    consumable = true,

                    onConsume = function(obj)
                        gAudio['collect']:play()
                        table.remove(obj)
                        score = score + 5
                    end
                    
                })
            elseif math.random(7) == 7 then
                table.insert(objects, GameObject{
                    texture = 'orange',
                    x = x * (VIRTUAL_WIDTH / 3) + 24,
                    y = y * CLOUD_GAP - 20,
                    width = 24,
                    height = 24,
                    collidable = true,
                    hit = true,
                    consumable = true,

                    onConsume = function(obj)
                        gAudio['collect']:play()
                        table.remove(obj)
                        score = score + 1
                    end
                    
                })

            elseif y == generateEnd then
                table.insert(objects, GameObject{
                    texture = 'easter-egg',
                    x = x * (VIRTUAL_WIDTH / 3) + 24,
                    y = -generateEnd - 16,
                    width = 16,
                    height = 16,
                    collidable = true,
                    hit = true,
                    consumable = true,

                    onConsume = function(obj)
                        gAudio['easter']:play()
                        player.score = score + 100
                        currentScore = score
                        level_width = width
                        level_height = height * 2
                        LevelMaker.generate(level_width, level_height)
                        gStateMachine:change('play')
                    end
                })
            end
        end

    end

    return GameLevel(entities, objects)
end
