class Character
  attr_accessor :name, :alignment, :armor, :hp, :abilities, :xp, :level, :attack_bonus

  def initialize(abilities = {str:10, dex:10, con:10, int:10, wis:10, cha:10})
    self.name = 'Bob'
    self.alignment = 'Neutral'
    self.level = 1
    self.abilities = abilities
    self.armor = 10 + get_modifier(abilities[:dex])
    self.hp = 5 + get_modifier(abilities[:con])
    self.attack_bonus = 0
    self.xp = 0
  end

  def attack(roll, target)
    if hit?(roll, target.armor, abilities[:str])
      deal_damage(target, roll)
      gain_experience(10)
    end
  end

  def deal_damage(target, roll)
    roll == 20 ? multiplier = 2 : multiplier = 1
    damage = (1 + get_modifier(abilities[:str])) * multiplier
    damage = 1 if damage < 1
    target.hp -= damage
  end

  def hit?(roll, target_armor, strength)
    roll + attack_bonus + get_modifier(strength) >= target_armor
  end

  def dead?
    hp <= 0
  end

  def get_modifier(score)
    ((score - 10)/2).floor
  end

  def gain_experience(xp_gain)
    self.xp += xp_gain
    while xp >= 1000
      level_up
    end
  end

  def level_up
    self.level += 1
    self.hp += 5 + get_modifier(abilities[:con])
    self.attack_bonus += 1 if level.even?
    self.xp -= 1000
  end

end