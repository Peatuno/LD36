-------------------------------------------------
-- PH-name #LD36
-- Website: http://jksoft.se
-- Licence: ZLIB/libpng
-- Copyright (c) 2016 JKsoft
-------------------------------------------------

require 'game'
require 'settings'


function love.load()
  love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT, {resizable=false, vsync=false, minwidth=800, minheight=600})
  love.window.setTitle("LD36 (PeatUno) - PH-name")
  game = Game:new()
end

function love.update(dt)
  game:update(dt)
end

function love.draw()
  game:draw()
end
