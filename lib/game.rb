class Game

    attr_accessor :human_player, :enemies

    def initialize(name)
        human_player = HumanPlayer.new(name)
        player1 = Player.new("Josiane")
        player2 = Player.new("José")
        player3 = Player.new("Patrick")
        player4 = Player.new("Fred")
        enemies = [player1, player2, player3, player4]
    end

    def kill_player(player)
        enemies.delete(player)
    end

    def is_still_ongoing?
        human_player.life_points > 0 && enemies.length > 0 ? true : false
    end

    def show_players
        human_player.show_state
        puts "Il reste #{enemies.length}"
    end

    def menu
        puts "","-"*30,""
        puts "Quelle action veux-tu effectuer?",""
        puts "a - chercher une meilleure arme"
        puts "s - chercher à me soigner",""
        puts "attaquer un joueur en vue :"
        enemies.each do |enemy|
            print "#{enemies.index(enemy)} - "
            puts enemy.show_state
        end
        puts ""
    end

    def menu_choice(input)
        if input == "a"
            puts ""
            human_player.search_weapon
        elsif input == "s"
            puts ""
            human_player.search_health_pack
        else
            puts ""
            target = enemies[input.to_i]
            human_player.attacks(target)
            if target.life_points <= 0 then kill_player(target) end
        end
    end

    def enemies_attack
        puts "","Les autres joueurs t'attaquent!",""
        enemies.each {|enemy| enemy.attacks(human_player)}
    end

    def end
        puts "La partie est finie!"
        if human_player.life_points > 0
            puts "Bravo tu as gagné!"
        else 
            puts "Loser t'as perdu!" 
        end
    end
end