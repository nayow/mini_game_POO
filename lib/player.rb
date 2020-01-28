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