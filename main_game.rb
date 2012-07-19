#!/usr/bin/env ruby

require 'gosu'

class GameWindow < Gosu::Window
  def initialize
    super 800, 600, false
    self.caption = "Meteorocks"
  end

  def update
  end

  def draw
  end
end

window = GameWindow.new
window.show
