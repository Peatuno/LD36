Telegraph = class('Telegraph')

function Telegraph:initialize(x, y)
  self.x = x
  self.y = y
end
function Telegraph:draw()
  love.graphics.draw(texturemap, telegraph_1, self.x, self.y)
end
