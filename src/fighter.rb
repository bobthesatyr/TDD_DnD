class Fighter < Character

  def initialize(abilities = {str:10, dex:10, con:10, int:10, wis:10, cha:10})
    super(abilities, 10)
  end

  def gain_attack_bonus
    self.attack_bonus += 1
  end

end