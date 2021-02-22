
Checkbox = Class{}

function Checkbox:init(text, x, y)
    self.text = text
    self.x = x
    self.y = y

    self.boxSize = 10

    self.textActiveState = {0, 0, 0, 1}
    self.textInactiveState = {0, 0, 0, 0.5}

    self.boxActiveState = 'line'
    self.boxInactiveState = 'fill'

    self.defaultColor = self.textActiveState
    self.defaultBoxState = self.boxActiveState
end

function Checkbox:update()
    local left_click = love.mouse.isDown(1)

    if distanceBetween(self.x, self.y) < self.boxSize and left_click then

        if self.defaultBoxState == self.boxActiveState then
            self.defaultBoxState = self.boxInactiveState
            self.defaultColor = self.textInactiveState
            
        elseif self.defaultBoxState == self.boxInactiveState then
            self.defaultBoxState = self.boxInactiveState
            self.defaultColor = self.textActiveState
        end
    end
end

function Checkbox:render()
    love.graphics.setColor(self.textActiveState)
    love.graphics.rectangle(self.defaultBoxState, self.x, self.y, self.boxSize, self.boxSize)
    love.graphics.setColor(self.defaultColor)

    local font = love.graphics.getFont()
    local fontHeight = font:getHeight(self.text)

    love.graphics.print(self.text, (self.x + self.boxSize) + 20, (self.y + self.boxSize) - (fontHeight))
end