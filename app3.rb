require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player3'

puts "","-"*50
puts "     Bienvenue sur ILS VEULENT TOUS MA POO!"
puts "  Le but du jeu est d'être le dernier survivant!"
puts "-"*50,""

print "Le nom de ton joueur? "
my_game = Game.new(gets.chomp)

while my_game.is_still_ongoing?
    my_game.menu
    my_game.menu_choice(gets.chomp)
    my_game.enemies_attack
end
my_game.end