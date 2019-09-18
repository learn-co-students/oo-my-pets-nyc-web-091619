class Owner
  attr_reader :name, :species

  @@all = []

  def initialize(name)
   @name = name
   @species = "human"
   @@all << self
  end

  def say_species
    "I am a #{species}."
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

  def buy_cat(name)
    new_cat = Cat.new(name, self)
  end

  def buy_dog(name)
    new_dog = Dog.new(name, self)
  end

  def walk_dogs
    Dog.all.map do |dog|
      dog.mood = "happy"
    end
  end
  
  def feed_cats
    Cat.all.map do |cat|
      cat.mood = "happy"
    end
  end

  def my_cats
    Cat.all.select do |cat|
      cat.owner == self
    end
  end

  def my_dogs
    Dog.all.select do |dog|
      dog.owner == self
    end
  end

  def sell_pets
    my_dogs.each do |dog|
      dog.mood = "nervous"
      dog.owner = nil
    end

    my_cats.each do |cat|
      cat.mood = "nervous"
      cat.owner = nil
    end

  end
  
  def list_pets
    "I have #{my_dogs.length} dog(s), and #{my_cats.length} cat(s)."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all.clear
  end

end