
Clouds = Class{}

function Clouds:init(x, y)
    self.x = x
    self.y= y
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