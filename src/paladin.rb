class Paladin < Character

  def initialize(abilities = {str:10, dex:10, con:10, int:10, wis:10, cha:10})
    super(abilities, 8)
  end

  def attack(roll, target)
    self.attack_bonus += 2 if target.alignment == 'Evil'
    super(roll, target)
    self.attack_bonus -= 2 if target.alignment == 'Evil'
  end

  def deal_damage(target, roll, base_damage = 1)

    if target.alignment == 'Evil'
      self.critical_multiplier = 3
      base_damage += 2
    end

    super(target, roll, base_damage)
  end

  def gain_attack_bonus
    self.attack_bonus += 1
  end

end