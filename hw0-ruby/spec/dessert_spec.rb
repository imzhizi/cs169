require 'dessert'

describe Dessert do
  describe 'cake' do
    subject {Dessert.new('cake', 400)}
    it {expect(subject.name).to eq('cake')}
    it {expect(subject.calories).to eq(400)}
    it {should be_delicious}
    it {expect(subject).to_not be_healthy}
  end

  describe 'apple' do
    subject {Dessert.new('apple', 75)}
    it {should be_delicious}
    it {should be_healthy}
  end

  describe 'can set' do
    before(:each) {@dessert = Dessert.new('xxx', 0)}
    it 'calories' do
      @dessert.calories = 80
      @dessert.calories.should == 80
    end
    it 'name' do
      @dessert.name = 'ice cream'
      @dessert.name.should == 'ice cream'
    end
  end
end

describe JellyBean do
  describe 'when non-licorice' do
    subject {JellyBean.new('vanilla')}
    it {expect(subject.calories).to eq(5)}
    it {expect(subject.name).to match /vanilla jelly bean/i}
    it {should be_delicious}
  end

  describe 'when licorice' do
    subject {JellyBean.new('licorice')}
    it {should_not be_delicious}
  end
end