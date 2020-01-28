class Game
    attr_accessor :human_player, :enemies_in_sight, :players_left

    def initialize(name)
        @human_player = HumanPlayer.new(name)
        @players_left = 5
        @enemies_in_sight = Array.new
    end

    def kill_player(player)
        enemies_in_sight.delete(player)
        @players_left -= 1
    end

    def new_players_in_sight
        if enemies_in_sight.length == players_left
            puts "","Tous les joueurs sont déjà en vue",""
        else
            random = rand(1..6)
            if random == 1
                puts "","Aucun nouvel ennemi en vue",""
            elsif random >= 2 && random <= 4
                puts "","Un nouvel ennemi en vue",""
                enemies_in_sight << Player.new("player_#{rand(1000..9999)}")
            else
                puts "","Deux nouveaux ennemies en vue",""
                enemies_in_sight << Player.new("player_#{rand(1000..9999)}")
                enemies_in_sight << Player.new("player_#{rand(1000..9999)}")
            end
        end
    end

    def is_still_ongoing?
        human_player.life_points > 0 && players_left >= 1 ? true : false
    end

    def show_players
        human_player.show_state
        puts "Il reste #{players_left} ennemi(s)"
    end

    def menu
        puts show_players,"-"*50
        puts "","Quelle action veux-tu effectuer?",""
        puts "a - chercher une meilleure arme"
        puts "s - chercher à me soigner",""
        unless enemies_in_sight.length == 0
            puts "Attaquer un ennemi en vue :",""
            enemies_in_sight.each do |enemy|
                print "#{enemies_in_sight.index(enemy)} - "
                print enemy.show_state
            end
        end
        puts "","#"*50
    end

    def menu_choice(input)
        if input == "a"
            # puts ""
            human_player.search_weapon
        elsif input == "s"
            # puts ""
            human_player.search_health_pack
        else
            # puts ""
            target = enemies_in_sight[input.to_i]
            human_player.attacks(target)
            if target.life_points <= 0 then kill_player(target) end
        end
    end

    def enemies_attack
        unless players_left == 0 || enemies_in_sight.length == 0
            puts "","-"*50
            puts "","Les autres joueurs t'attaquent!",""
            enemies_in_sight.each {|enemy| enemy.attacks(human_player)}
            puts ""
        end
    end

    def finish
        puts "#"*50,"","La partie est finie!"
        if human_player.life_points > 0
            puts "Bravo tu as gagné!","","#"*50
        else 
            puts "Loser t'as perdu!","","#"*50
        end
    end
end