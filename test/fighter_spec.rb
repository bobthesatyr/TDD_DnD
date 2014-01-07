describe Fighter do

  before (:each) do
    subject = Fighter.new
    @enemy = Character.new
  end

  it 'has increased attack rolls for every level' do
    subject.gain_experience(2000)
    subject.attack(8, @enemy)
    subject.xp.should eq(10)
  end

  it 'should have 10 base hp per level instead of 5' do
    subject.hp.should eq 10
    subject.gain_experience 1000
    subject.hp.should eq 20
  end
end
