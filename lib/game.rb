require_relative './player.rb'

class Game
    attr_accessor :human_player :enemies

    def initialize(user)
        @human_player = HumainPlayer.new(user)
        @enemies = []

    def kill_player(player)
        @enemies.each do |ennemy|
            if enemy.name == player
             @enemies.delete(enemy)
            end   
        end
    end

    def is_still_ongoing?
        @human_player.life_points > 0
    end

    def show_players
    @human_player.show_state
    puts "Il reste #{@enemies.count} ennemies en vie."
  end

end