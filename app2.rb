require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "","-"*50
puts "     Bienvenue sur ILS VEULENT TOUS MA POO!"
puts "  Le but du jeu est d'être le dernier survivant!"
puts "-"*50,""

print "Le nom de ton joueur ? "
input_name = gets.chomp
human_player = HumanPlayer.new(input_name)
player1 = Player.new("Josiane")
player2 = Player.new("José")
enemies = [player1, player2]

until human_player.life_points <= 0 || (player1.life_points <= 0 && player2.life_points <= 0)
    puts "Quelle action veux-tu effectuer?",""
    puts "a - chercher une meilleure arme"
    puts "s - chercher à me soigner",""
    puts "attaquer un joueur en vue :"
    puts "0 - #{player1.show_state}"
    puts "1 - #{player2.show_state}"

    case gets().strip()
    when "a"
        human_player.search_weapon
    when "s"
        human_player.search_health_pack
    when "0"
        human_player.attacks(player1)
    when "1"
        human_player.attacks(player2)
    end

    puts "Les autres joueurs t'attaquent!"
    enemies.each do |enemy|
        if enemy.life_points >= 0 then enemy.attacks(human_player) end
    end

    
end

puts "La partie est finie!"
if human_player.life_points > 0
    puts "Bravo tu as gagné!"
else puts "Loser t'as perdu!" 
end



binding.pry
