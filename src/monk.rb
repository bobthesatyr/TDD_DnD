class Monk < Character

  def initialize(abilities = {str:10, dex:10, con:10, int:10, wis:10, cha:10})
    super(abilities, 6)
  end

  def deal_damage(target, roll)
    super(target, roll, 3)
  end

  def initialize_armor(abilities)
    super(abilities) + [0, get_modifier(abilities[:wis])].max
  end

  def gain_attack_bonus
    self.attack_bonus += 1 if level.even? || level % 3 == 0
  end

end