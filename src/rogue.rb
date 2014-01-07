class Rogue < Character

  def initialize(abilities = {str:10, dex:10, con:10, int:10, wis:10, cha:10})
    super (abilities)
    self.critical_multiplier = 3
  end

  def attack(roll, target)
    target.armor -= get_modifier(target.abilities[:dex])
    super(roll, target)
    target.armor += get_modifier(target.abilities[:dex])
  end

  def attack_with_ability
    get_modifier(abilities[:dex])
  end
end