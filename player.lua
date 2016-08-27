local anim8 = require 'libs/anim8'

Player = class('Player')

function Player:initialize(x, y)
  self.x = x
  self.y = y

  self.width = 64
  self.height = 64

  self.speed = 200
  self.diagonalspeed = 150

  ----------------------------
  -- Directions
  --      3
  --   4     2
  --      1
  ------------------------------
  self.idleatlas = love.graphics.newImage("Assets/sture.png")
  self.idle_1 = love.graphics.newQuad(0, 0, 64, 64, self.idleatlas:getDimensions())

end

function Player:update(dt)
  --Fulfix för att dra ner speeden vid rörelse i två axlar samtidigt
  if love.keyboard.isDown("a") and love.keyboard.isDown("s") then
    self.x = self.x - dt * self.diagonalspeed
    self.y = self.y + dt * self.diagonalspeed
  elseif love.keyboard.isDown("a") and love.keyboard.isDown("w") then
    self.x = self.x - dt * self.diagonalspeed
    self.y = self.y - dt * self.diagonalspeed
  elseif love.keyboard.isDown("d") and love.keyboard.isDown("s") then
    self.x = self.x + dt * self.diagonalspeed
    self.y = self.y + dt * self.diagonalspeed
  elseif love.keyboard.isDown("d") and love.keyboard.isDown("w") then
    self.x = self.x + dt * self.diagonalspeed
    self.y = self.y - dt * self.diagonalspeed
  --standard
  elseif love.keyboard.isDown("d") then --right 2
    self.x = self.x + dt * self.speed
  elseif love.keyboard.isDown("a") then --left 4
    self.x = self.x - dt * self.speed
  elseif love.keyboard.isDown("w") then --up 3
    self.y = self.y - dt * self.speed
  elseif love.keyboard.isDown("s") then --down 1
    self.y = self.y + dt * self.speed
  end
end
function Player:draw()
  love.graphics.draw(self.idleatlas, self.idle_1, self.x, self.y)
end
