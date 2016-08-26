HC       = require 'libs/HC'
class    = require 'libs/middleclass'
require 'settings'

local k = love.keyboard

Game = class('Game')

function Game:initialize()
  bg = love.graphics.newImage("Assets/bg.png")

end


function Game:update(dt)

end

function Game:draw()
  love.graphics.draw(bg)

end
