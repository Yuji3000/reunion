require './lib/reunion'
require './lib/activity'
require 'rspec'

describe Reunion do
  before(:each) do
    @reunion = Reunion.new("1406 BE")
  end
    describe '#initialize' do
      it 'exists' do
        expect(@reunion).to be_an_instance_of(Reunion)
      end
      it 'has a name' do
        expect(@reunion.name).to eq("1406 BE")
      end
      it 'has activities' do
        expect(@reunion.activities).to eq([])
      end
    end
    describe '#add_activity' do
      it 'can add activities to a reunion' do
        activity_1 = Activity.new("Brunch")
        @reunion.add_activity(activity_1)
        expect(@reunion.activities).to eq([activity_1])
      end
    end
end