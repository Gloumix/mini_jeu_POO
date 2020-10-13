class Player
  
  attr_accessor :name , :life_points
  
  def initialize (player)
    @name = player
    @life_points = 10
  end

  def show_state
    puts "#{@name} a #{@life_points} point(s) de vie"
  end

  def gets_damage (damage)
    @life_points = @life_points - damage
    if @life_points <= 0
      puts "Le joueur #{@name} a été tué !"
      @life_points = 0
    end
  end

  def attacks (monster)
    puts
    puts "Le joueur #{@name} attaque le joueur #{monster.name}"
    dice_roll = compute_damage
    puts "Il lui inflige #{dice_roll} points de dommages"
    monster.gets_damage(dice_roll)
  end

  def compute_damage
    return rand(1..6)
  end
end

class HumanPlayer
  
  attr_accessor :name , :life_points , :weapon_level
  
  def initialize (player)
    @name = player
    @life_points = 100
    @weapon_level = 1
  end

  def show_state
    puts "#{@name} a #{@life_points} point(s) de vie et une arme de niveau #{@weapon_level}"
  end

  def gets_damage (damage)
    @life_points = @life_points - damage
    if @life_points <= 0
      puts "Le joueur #{@name} a été tué !"
      @life_points = 0
    end
  end

  def attacks (monster)
    puts
    puts "Le joueur #{@name} attaque le joueur #{monster.name}"
    dice_roll = compute_damage
    puts "Il lui inflige #{dice_roll} points de dommages"
    monster.gets_damage(dice_roll)
  end

  def compute_damage
    return rand(1..6) * @weapon_level
  end

  def search_weapon
    dice = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{dice}"
    if dice > @weapon_level
      puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
      @weapon_level = dice
    else
      puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
    end
  end

  def search_health_pack
    dice = rand(1..6)
    if dice == 1
      puts "Tu n'as rien trouvé... "
    elsif dice == 6
      puts "Waow, tu as trouvé un pack de +80 points de vie !"
      @life_points = @life_points + 80
      if @life_points > 100
        @life_points = 100
      end
    else
      puts "Bravo, tu as trouvé un pack de +50 points de vie !"
      @life_points = @life_points + 50
      if @life_points > 100
        @life_points = 100
      end
    end
  end
end
  

