class Kudomon
  attr_reader :species, :type, :x_position, :y_position, :health, :attack, :owner
  STATS = {
    "Sourbulb" => {
      type: :grass, health: 15, attack: 8
    },
    "Mancharred" => {
      type: :fire, health: 20, attack: 7
    },
    "Chikapu" => {
      type: :electric, health: 20, attack: 10
    },
    "Spurtle" => {
      type: :water, health: 15, attack: 8
    },
    "Geoman" => {
      type: :rock, health: 25, attack: 6
    },
    "Slowtouch" => {
      type: :psychic, health: 13, attack: 3
    }
   }
   WEAKNESS = {
     water: :fire,
     fire: :grass,
     grass: :rock,
     rock: :electric,
     electric: :water
   }
  def initialize (species, x_position, y_position )
    fail 'Species is not valid' unless STATS[species]
    @species = species
    @x_position = x_position
    @y_position = y_position
    @type = STATS[species][:type]
    @health = STATS[species][:health]
    @attack =STATS[species][:attack]
    @owner = []
  end

  def damage(points)
    @health -= points
  end

  def new_owner(trainer)
    owner << trainer
  end

  def check_owner(trainer)
    return owner.include?(trainer)
  end

  def calculate_attack(opponent)
    if (@type == :psychic && opponent != :psychic) || opponent == WEAKNESS[@type]
      return @attack+3
    else return @attack
    end
  end
end
