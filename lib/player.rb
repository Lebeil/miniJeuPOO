# 2 joueurs ;
# Que chaque joueur ait un niveau de vie donné ;
# Que ce niveau de vie baisse à chaque attaque subie ;
# Si la vie atteint zéro, le personnage est mort.

class Player
    attr_accessor :name, :life_points

    def initialize(name)
        @name = name
        @life_points = 10
    end

    def show_state
        print "#{@name} a #{@life_points} points de vie"
    end

    def gets_damage(damage)
        @life_points = @life_points - damage
         if @life_points <= 0
        puts "Le joueur #{name} a été tué !"
        end
    end

    def attacks(player_name)
            puts "Le joueur #{@name} attaque le joueur #{player_name.name}"
        attack_player = self.compute_damage
        player_name.gets_damage(attack_player)
            print "Il lui inflige #{attack_player} points de dommages" if player_name.life_points > 0
    end

    def compute_damage
        return rand(1..6)
    end

end

class HumainPlayer < Player
    attr_accessor :weapon_level

    def initialize(name)
        @name = name
        @weapon_level = 1
        @life_points = 100
    end

    def show_state
        puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
    end

    def compute_damage
        return rand(1..6) * @weapon_level
    end

    def search_weapon
        weapon = rand(1..6)
        puts "Tu as trouvé une arme de niveau #{weapon}"
        if weapon > @weapon_level
            @weapon_level = weapon
            puts "Youhou! elle est meilleure que ton arme actuelle: tu la prends."
        else 
            puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
        end
    end

    def search_health_pack
        pack = rand(1...6)
        if pack == 1
            puts "Tu n'as rien trouvé :'("
        elsif pack >= 2 && pack <= 5
            @life_points = @life_points + 50
        else
            @life_points = @life_points + 80
            puts "Waow, tu as trouvé un pack de +80 points de vie !"
        end
    end
end