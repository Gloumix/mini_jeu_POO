class Game
  attr_accessor :human_player
  def initialize(name)
    @enemies = Array.new
    @human_player = HumanPlayer.new(name)
    for i in 0...4
      @enemies[i] = (Player.new("Monstre_#{1+i}"))
    end
  end

  def kill_player(player)
    @enemies.delete(player)
  end

  def is_still_ongoing? 
    if @human_player.life_points == 0 || @enemies == []
      return false
    else
      return true
    end
  end

  def show_players
    puts
    puts "Tu as #{@human_player.life_points} points de vie."
    puts "Il reste #{@enemies.length} ennemis."
  end

  def menu
    puts "Quelle action veux-tu effectuer ?"
    puts
    puts "a - chercher une meilleure arme"
    puts "s - chercher à se soigner"
    puts
    puts "Attaquer un ennemi en vue :"
    for i in 0...@enemies.length
      puts "#{i} - #{@enemies[i].name} a #{@enemies[i].life_points} points de vie"
    end
    puts
    print "> "
  end

  def menu_choice(action)
    if action == "a"
      @human_player.search_weapon
    elsif action == "s"
      @human_player.search_health_pack
    else
      action=action.to_i
      @human_player.attacks(@enemies[action])
      if @enemies[action].life_points == 0
        kill_player(@enemies[action])
      end
    end
  end

  def enemies_attack
    @enemies.each do |n|
      n.attacks(@human_player)
      if @human_player.life_points == 0
        break
      end
    end
  end

  def end
    puts "Le jeu est fini."
    if @human_player.life_points > 0
      puts "Tu as gagné !"
    else
      puts "Tu as perdu !"
    end
  end
end
