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
end
