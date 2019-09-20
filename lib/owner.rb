require 'pry'
class Owner
  # code goes here
  attr_reader :name, :species, :cat, :dog

  @@human = []

  def initialize(name)
    @name = name
    @species  = "human"
    @@human << self
  end 

  def say_species
    "I am a #{self.species}."
  end 

  def self.all
    @@human
  end

  def self.count
    self.all.count
  end 

  def self.reset_all
    self.all.clear
  end 

  def cats
    Cat.all.select {|cat| cat.owner == self}
  end 

  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end 

  def buy_cat(name)
    Cat.new(name,self)
  end 

  def buy_dog(name)
    Dog.new(name,self)
  end 

  def walk_dogs
    self.dogs.each {|dog| dog.mood = "happy"}
  end

  def feed_cats
    self.cats.each {|cat| cat.mood = "happy"}
  end 

  def sell_pets
    self.cats.each do |c| 
      c.owner = nil
      c.mood = "nervous" 
    end 

    self.dogs.each do |d| 
      d.owner = nil 
      d.mood = "nervous"
    end 
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end 
end

