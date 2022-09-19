require './lib/activity'
require 'rspec'

describe Activity do
  before(:each) do
    @activity = Activity.new("Brunch")
  end
  describe '#initialize' do
    it 'exists' do
      expect(@activity).to be_an_instance_of(Activity)
    end
    it 'has a name' do
      expect(@activity.name).to eq("Brunch")

    end
    it 'can add participants' do
      expect(@activity.participants).to eq({})
      @activity.add_participant("Maria", 20)
      expect(@activity.participants).to eq({"Maria" => 20})
      @activity.add_participant("Luther", 40)
      expect(@activity.participants).to eq({"Maria" => 20, "Luther" => 40})
    end
    it 'has a cost' do
      @activity.add_participant("Maria", 20)
      @activity.add_participant("Luther", 40)
      expect(@activity.total_cost).to eq(60)
    end
    it 'bill can be split evenly' do
      @activity.add_participant("Maria", 20)
      @activity.add_participant("Luther", 40)
      @activity.split
      expect(@activity.split).to eq(30)
      @activity.owed
      expect(@activity.owed).to eq({"Maria" => 10, "Luther" => -10})
    end
  end


end