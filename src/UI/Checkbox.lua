
Checkbox = Class{}

local height_percentage = 0.9
local padding = 10
local line_width = 4

function Checkbox:init(text, x, y, width, height)
    self.text = text
    self.x = x
    self.y = y
    self.width = width
    self.height = height

    self.cb_height = self.height * height_percentage
    self.cb_width = self.cb_height

    self.isChecked = true

    self.color = {0, 0, 0, 1}
    self.prev_left_click = false
end

function Checkbox:set_box(width, height)
    height = height or width
    self.cb_height = math.min(self.height, height)
    self.cb_width = math.min(self.width, width)
end

local function mouse_bound(self, mouseX, mouseY)
    return mouseX >= self.x and mouseX <= self.x + self.width and mouseY >= self.y and mouseY <= self.y + self.height
end

function Checkbox:update()
    local left_click = love.mouse.isDown(1)
    local in_bound = mouse_bound(self, mousePosition.x, mousePosition.y)

    if in_bound and left_click and not self.prev_left_click then
        self.isChecked = not self.isChecked
        if self.isChecked == true then
            main_music:play()
        elseif self.isChecked == false then
            main_music:pause()
        end
    end

    self.prev_left_click = left_click
end

function Checkbox:render()
    local r, g, b, a = love.graphics.getColor()
    love.graphics.setColor(self.color)

    local font = love.graphics.getFont()
    local _, lines = font:getWrap(self.text, self.width)
    local fontHeight = font:getHeight(self.label)
    local lw = love.graphics.getLineWidth()

    -- love.graphics.rectangle('fill', self.x, self.y, self.width, self.height, 8, 8)
    love.graphics.setLineWidth(line_width)
    love.graphics.rectangle('line', self.x, self.y, self.cb_width, self.cb_height, 5, 5)

    if self.isChecked then
        love.graphics.rectangle('fill', self.x + line_width, self.y + line_width, self.cb_width - 2 * line_width, self.cb_height - 2 * line_width) 
    end

    love.graphics.printf(self.text, self.x + self.cb_width + padding, self.y + self.height - (fontHeight * #lines), self.x - (self.cb_width + padding), 'left')

    love.graphics.setColor(r, g, b, a)
    love.graphics.setLineWidth(lw)
    
end