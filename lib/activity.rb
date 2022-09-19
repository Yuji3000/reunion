require 'pry'
class Activity
attr_reader :name, :participants
  def initialize(name)
    @name = name
    @participants = {}
  end

  def add_participant(name, cost)
   @participants[name] = cost
  end

  def total_cost
    sum = 0
    @participants.map do |participant, costs|
      sum += costs
    end
    sum   
  end 

  def split
    # binding.pry
    total_cost / (@participants.keys.count)
  end

  def owed
    owe = Hash.new(0) 
    @participants.map do |participant, costs|
      owe[participant] = (split - costs)
      owe
    end
  end
end