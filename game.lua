HC       = require 'libs/HC'
class    = require 'libs/middleclass'
require 'settings'
require 'player'
require 'machines/telegraph'

local k = love.keyboard

Game = class('Game')

function Game:initialize()
  self.map = {
    {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
    {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
    {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
    {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
    {1, 1, 2, 3, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
    {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
    {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
    {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
    {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
    {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
    {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
    {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
  }
  texturemap = love.graphics.newImage("Assets/textures.png")
  floortile = love.graphics.newQuad(0, 0, 32, 32, texturemap:getDimensions())
  matta1 = love.graphics.newQuad(0, 32, 32, 32, texturemap:getDimensions())
  matta2 = love.graphics.newQuad(32, 32, 32, 32, texturemap:getDimensions())

  telegraph_1 = love.graphics.newQuad(32, 0, 32, 32, texturemap:getDimensions())


  player = Player:new(64, 64)


  test = Telegraph:new(128, 128)
end


function Game:update(dt)
  player:update(dt)
end

function Game:draw()
  for y=1, #self.map do
    for x=1, #self.map[y] do
      if self.map[y][x] == 1 then
        love.graphics.draw(texturemap, floortile, x * 32, y * 32)
      elseif self.map[y][x] == 2 then
        love.graphics.draw(texturemap, matta1, x * 32, y * 32)
      elseif self.map[y][x] == 3 then
        love.graphics.draw(texturemap, matta2, x * 32, y * 32)
      end
    end
  end

  test:draw()

  player:draw()
end
