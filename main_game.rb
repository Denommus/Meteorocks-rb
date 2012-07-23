#!/usr/bin/env ruby

require 'gosu'
%w(player meteor).each { |s| require "./#{s}.rb" }
require "./screens/stage1.rb"

class GameWindow < Gosu::Window
  attr_writer :screen
  def initialize
    super 800, 600, false
    self.caption = "Meteorocks"
    @screen = Stage1.new(self)
  end

  def update
    @screen.update
  end

  def draw
    @screen.draw
  end
end

window = GameWindow.new
window.show
