class Battle
  attr_reader :kudomons
  def initialize (kudomon1, kudomon2)
    @kudomons = [kudomon1, kudomon2].shuffle
  end

  def fight
    while true
      @kudomons = kudomons.rotate
      optype = kudomons[1].type
      dmg = kudomons[0].calculate_attack(optype)
      kudomons[1].damage(dmg)
      if kudomons[0].health <= 0 || kudomons[1].health <= 0
        break
      end
    end
  end
end
