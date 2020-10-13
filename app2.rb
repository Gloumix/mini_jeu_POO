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

player1 = HumanPlayer.new(name)
ennemies = Array.new
ennemies[0] = Player.new("José")
ennemies[1] = Player.new("Josiane")

while player1.life_points >0 && (ennemies[0].life_points > 0 || ennemies[1].life_points >0)
  puts "Tu as #{player1.life_points} points de vie."
  puts
  puts "Quelle action veux-tu effectuer ?"
  puts
  puts "a - chercher une meilleure arme"
  puts "s - chercher à se soigner"
  puts
  puts "Attaquer un joueur en vue :"
  puts "0 - #{ennemies[0].name} a #{ennemies[0].life_points} points de vie"
  puts "1 - #{ennemies[1].name} a #{ennemies[1].life_points} points de vie"
  puts
  print "> "
  input = gets.chomp
  puts

  if input == "a"
    player1.search_weapon
  end
  if input == "s"
    player1.search_health_pack
  end
  if input == "0"
    player1.attacks(ennemies[0])
  end
  if input == "1"
    player1.attacks(ennemies[1])
  end
  puts
  puts "C'est au tour des ennemis !"
  ennemies.each do |n|
    if n.life_points > 0
      n.attacks(player1)
    end
  end
  puts
  gets.chomp
end

if player1.life_points == 0
  puts "Tu as perdu !"
else
  puts "Tu as gagné !"
end

