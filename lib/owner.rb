require "pry"
class Owner

  @@all = []

  attr_reader :name, :species

  def initialize(name)
    @name = name 
    @species = "human"
    @@all << self 
  end 

  def say_species
    return "I am a #{self.species}."
  end

  def self.all 
    @@all 
  end 

  def self.count 
    self.all.length
  end 

  def self.reset_all
    self.all.clear 
  end 

  def cats
    Cat.all.select do |cat|
      cat.owner == self 
    end 
  end 

  def dogs
    Dog.all.select do |dog|
      dog.owner == self 
  end
end 

def buy_cat (name)
  cats << Cat.new(name,self)
end 

def buy_dog (name)
  dogs << Dog.new(name, self)
end 

def walk_dogs 
  dogs.map do |dog|
    dog.mood = "happy"
  end 
end 

def feed_cats 
  cats.map do |cat|
    cat.mood = "happy"
  end 
end 

def sell_pets 
  cats.map do |cat|
    cat.mood = "nervous"
    cat.owner = nil
  end 
  dogs.map do |dog|
    dog.mood = "nervous"
    dog.owner = nil
  end 
end 

def list_pets 
  return "I have #{self.cats.length} dog(s), and #{self.dogs.length} cat(s)."
end

end