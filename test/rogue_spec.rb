describe Rogue do

  before (:each) do
    subject = Rogue.new
    @enemy = Character.new
  end

  it 'does triple damage on crits' do
    subject.attack(20, @enemy)
    @enemy.hp.should eq(2)
  end

  it 'should ignore opponent Dexterity to armor when attacking' do
    @enemy = Character.new({str:10, dex:18, con:10, int:10, wis:10, cha:10})
    subject.attack(10, @enemy)
    subject.xp.should eq 10
  end

  it 'adds dex instead of strength for attacks' do
    subject = Rogue.new({str:1, dex:10, con:10, int:10, wis:10, cha:10})
    subject.attack(10, @enemy)
    subject.xp.should eq(10)
  end



end
