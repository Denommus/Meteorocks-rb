#!/usr/bin/env ruby

require 'gosu'
require './player.rb'
require './lib/math/vector.rb'

class GameWindow < Gosu::Window
  def initialize
    super 800, 600, false
    self.caption = "Meteorocks"
    @player = Player.new(self, 400, 300)
  end

  def update
    @player.update
  end

  def draw
    @player.draw
  end
end

window = GameWindow.new
window.show
