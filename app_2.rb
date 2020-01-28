#initial requirements
require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player2'

#head display
puts "","-"*50
puts "     Bienvenue sur ILS VEULENT TOUS MA POO!"
puts "  Le but du jeu est d'être le dernier survivant!"
puts "-"*50,""

#initializing the game with a user and two bots
print "Le nom de ton joueur ? "
input_name = gets.chomp
human_player = HumanPlayer.new(input_name)
player1 = Player.new("Josiane")
player2 = Player.new("José")
enemies = [player1, player2]

#run the game with different options to choose from until either user or both bots lose all their points
until human_player.life_points <= 0 || (player1.life_points <= 0 && player2.life_points <= 0)
    puts "","-"*30,""
    puts "Quelle action veux-tu effectuer?",""
    puts "a - chercher une meilleure arme"
    puts "s - chercher à me soigner",""
    puts "attaquer un joueur en vue :"
    print "0 - "
    player1.show_state
    print "1 - "
    player2.show_state
    puts ""

    case gets.chomp
    when "a"
        puts ""
        human_player.search_weapon
    when "s"
        puts ""
        human_player.search_health_pack
    when "0"
        puts ""
        human_player.attacks(player1)
    when "1"
        puts ""
        human_player.attacks(player2)
    end

    #don't show if the last one has just been killed
    unless player1.life_points <= 0 && player2.life_points <= 0
        puts "","Les autres joueurs t'attaquent!",""
        enemies.each do |enemy|
            if enemy.life_points >= 0 then enemy.attacks(human_player) end
        end
    end
end

#display finish
puts "","La partie est finie!"
if human_player.life_points > 0
    puts "Bravo tu as gagné!"
else 
    puts "Loser t'as perdu!" 
end
