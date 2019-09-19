class Dog

  attr_reader :name 
  attr_accessor :owner, :mood 

  @@_all_dogs = []

  def initialize (name, owner)
    @name = name
    @owner = owner 
    @mood = "nervous"
    @@_all_dogs << self 
  end 

  def self.all
    @@_all_dogs
  end 

end 
