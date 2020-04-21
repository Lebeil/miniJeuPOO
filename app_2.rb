require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "*-------------------------------------------------*"
puts "| Bienvenue sur 'ILS VEULENT TOUS MA POO' !       |"
puts "| Le but du jeu est d'être le dernier survivant ! |"
puts "*-------------------------------------------------*"

puts "Veuillez saisir votre prénom :"
player_name = gets.chomp.to_s
user_player = HumainPlayer.new(player_name)

player1 = Player.new("Josiane")
player2 = Player.new("José")

ennemies = [player1, player2]

while user_player.life_points > 0 && player1.life_points > 0 || player2.life_points > 0  
    user_player.show_state
    
    puts
    puts "Quelle action veux-tu effectuer ?"

puts "a - chercher une meilleure arme"
puts "s - chercher à se soigner" 

puts "attaquer un joueur en vue :"
puts "0 - #{player1.show_state}"
puts "1 - #{player2.show_state}"

    puts "Faites votre choix "

    choice = gets.chomp.to_s
    case choice
        when "a"
            user_player.search_weapon
        when "s"
            user_player.search_health_pack
        when "0"
            user_player.attacks(player1)
        when "1"
            user_player.attacks(player2)
        else
            puts "Erreur"
    end

    ennemies.each {|ennemy|
    if ennemy.life_points > 0
        puts "Les autres joueurs t'attaquent !"
        ennemy.attacks(user_player)

    end}


end     

if user_player.life_points <= 0
  puts "Perdu !!! "
else
  puts "La partie est finie ! Bravo ! Tu es le meilleur !!"
end
