require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

mario = Player.new("mario")
luigi = Player.new("luigi")
peach = Player.new("peach")
yoshi = Player.new("yoshi")