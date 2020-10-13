require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "------------------------------------------------"
puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
puts "|Le but du jeu est d'être le dernier survivant !|"
puts "-------------------------------------------------"

puts
puts "Quel nom va tu utiliser ?"
print "> "
name = gets.chomp
puts

jeu = Game.new(name)

while jeu.is_still_ongoing? 
  jeu.show_players
  jeu.menu
  action = gets.chomp
  jeu.menu_choice(action)
  jeu.enemies_attack
end

jeu.end

