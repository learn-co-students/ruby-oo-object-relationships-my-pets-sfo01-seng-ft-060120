require 'pry'

class Owner
  # code goes here
  attr_reader :species, :name

  @@all = []

  def initialize (name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    "I am a #{self.species}."
  end

  def cats 
    Cat.all.find_all { |cat| cat.owner == self }
  end

  def dogs
    Dog.all.find_all { |dog| dog.owner == self }
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    dogs.select { |dog| dog.mood = "happy" }
  end

  def feed_cats
    cats.select { |cat| cat.mood = "happy" }
  end

  def sell_pets
    dogs.select do |dog| 
      dog.mood = "nervous"
      dog.owner = nil
    end 
    cats.select do |cat|
      cat.mood = "nervous"
      cat.owner = nil
    end
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

  def self.all
    @@all
  end

  def self.count
    self.all.count
  end

  def self.reset_all
    self.all.clear
  end
end