require 'pry'
class Owner
  # code goes here
  attr_reader :name, :species

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    "I am a #{self.species}."
  end

  def self.all
    @@all
  end

  def self.count
    self.all.count
  end

  def self.reset_all
    @@all.clear
  end
  
  def cats
    Cat.all.select do |cat|
      cat.owner == self
    end
    # binding.pry
  end

  def dogs
    Dog.all.select do |dog|
      dog.owner == self
    end
    # binding.pry
  end

  def buy_cat(cat_name)
    cat = Cat.new(cat_name, self)
  end

  def buy_dog(dog_name)
    dog = Dog.new(dog_name, self)
  end

  def walk_dogs
    my_dogs = self.dogs
    my_dogs.map do |dog|
      dog.mood = "happy"
    end
  end

  def feed_cats
    my_cats = self.cats
    my_cats.map do |cat|
      cat.mood = "happy"
    end
  end

  def sell_pets
    self.dogs.map do |dog|
      dog.mood = "nervous"
      dog.owner = nil
    end
    self.cats.map do |cat|
      cat.mood = "nervous"
      cat.owner = nil
    end
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
end