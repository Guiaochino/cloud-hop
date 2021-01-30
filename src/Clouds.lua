Clouds = Class{}

clouds = love.graphics.newImage('graphics/clouds.png')
whiteC = love.graphics.newQuad(0, 0, 64, 16, clouds:getDimensions())
darkC = love.graphics.newQuad(64, 0, 64, 16, clouds:getDimensions())
thunderC = love.graphics.newQuad(128, 0, 64, 16, clouds:getDimensions())


function Clouds:init()
    self.x = math.random(VIRTUAL_WIDTH / 4, VIRTUAL_WIDTH - 10)

    self.y= VIRTUAL_HEIGHT

    self.cloudwidth = clouds:getWidth()

end

function Clouds:update(dt)
    if love.keyboard.isDown('space') then
        cameraScroll =  cameraScroll - CLOUD_SCROLL * dt
        self.y = self.y + CLOUD_SCROLL *dt
        
    end
end

function Clouds:render()
   love.graphics.draw(clouds, whiteC, 150, 200 )
   love.graphics.draw(clouds, darkC, 100, 100)    
   love.graphics.draw(clouds, thunderC, 50, 50)

end