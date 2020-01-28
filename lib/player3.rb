class Player

    attr_accessor :name, :life_points

    def initialize(name)
        @name = name
        @life_points = 10
    end

    def show_state
        puts "#{self.name} a #{self.life_points} points de vie"  
    end

    def gets_damage(damage_number)
        self.life_points -= damage_number
        if self.life_points <= 0 then puts "Le joueur #{self.name} est mort!" end
    end

    def attacks(player_number)
        puts "Le joueur #{self.name} attaque #{player_number.name}"
        damage_number = compute_damage
        puts "Il lui inflige #{damage_number} points de dommages"
        player_number.gets_damage(damage_number)
    end

    def compute_damage
        return rand(1..6)
    end

end

class HumanPlayer < Player

    attr_accessor :weapon_level

    def initialize(name)
        @name = name
        @life_points = 100
        @weapon_level = 1
    end

    def show_state
        puts "#{self.name} a #{self.life_points} points et une arme de niveau #{self.weapon_level}"
    end

    def compute_damage
        rand(1..6) * @weapon_level
    end

    def search_weapon
        weapon_found = rand(1..6)
        puts "Tu as trouvé une arme de niveau #{weapon_found}"
        if weapon_found > @weapon_level
            puts "Elle est meilleure, tu la prends!"
            @weapon_level = weapon_found
        else puts "Elle n'est pas vraiment mieux..." 
        end
    end

    def search_health_pack
        health_pack_found = rand(1..6)
        if health_pack_found == 1
            puts "Tu n'as rien trouvé..."
        elsif health_pack_found >= 2 && health_pack_found <= 5
            puts "Tu as trouvé 50 points de vie!"
            @life_points + 50 > 100 ? @life_points = 100 : @life_points += 50
        else 
            puts "Tu as trouvé 80 points de vie!"
            @life_points + 80 > 100 ? @life_points = 100 : @life_points += 80
        end
    end

end