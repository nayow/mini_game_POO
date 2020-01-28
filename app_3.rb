#initial requirements
require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player3'

#display game header
puts "","#"*50
puts "","     Bienvenue sur ILS VEULENT TOUS MA POO"
puts "  Le but du jeu est d'être le dernier survivant!",""
puts "#"*50,""

#defining user name to use for Game class
print "Le nom de ton joueur? "
my_game = Game.new(gets.chomp)
puts "","#"*50

#run all the methods in this specific order until game ends, with clear display
while my_game.is_still_ongoing?
    my_game.new_players_in_sight
    my_game.menu
    puts ""
    print "Ton choix? "
    my_game.menu_choice(gets.chomp)
    my_game.enemies_attack
    puts "-"*50
end

#display finish
my_game.finish