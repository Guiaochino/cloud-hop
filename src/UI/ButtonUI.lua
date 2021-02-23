
ButtonUI = Class{}

function ButtonUI:init(label, x, y, width, height, toState)
    self.label = label
    self.x = x
    self.y = y
    self.width = width
    self.height = height
    self.toState = toState

    self.normal = {0.1, 0.1, 0.1, 0.75}
    self.gray = {0.1, 0.1, 0.1, 1}

    self.color = self.normal

    self.buttonSize = math.sqrt((self.x)^2 + (self.y)^2)
end

local function mouse_bound(self, mouseX, mouseY)
    return mouseX >= self.x and mouseX <= self.x + self.width and mouseY >= self.y and mouseY <= self.y + self.height
end

function ButtonUI:update(dt)

    left_click = love.mouse.isDown(1)
    in_bound = mouse_bound(self, mousePosition.x, mousePosition.y)

    if in_bound and not left_click then
        self.color = self.gray

    elseif in_bound and left_click then
        gStateMachine:change(self.toState)
    else
        self.color = self.normal
    end

end

function ButtonUI:render()
    local r, g, b, a = love.graphics.getColor()
    love.graphics.setColor(self.color)
    love.graphics.rectangle('fill', self.x, self.y, self.width, self.height, 8, 8)
    love.graphics.setColor(r, g, b, a)

    local font = love.graphics.getFont()
    local fontWidth = font:getWidth(self.label)
    local fontHeight = font:getHeight(self.label)

    love.graphics.print(self.label, self.x + (self.width / 2) - (fontWidth / 2), self.y + fontHeight/2)
end