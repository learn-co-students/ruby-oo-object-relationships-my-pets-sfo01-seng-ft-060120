require 'pry'

class Owner 

  attr_reader :name, :species # cannot change owner's name, can't change its species

  @@all = []

  def initialize(owner_name) # can have a name, initializes with species set to huma, 
    @name = owner_name
    @species = "human"
    @@all << self
  end

  def say_species # say_species: can say its species
    "I am a human."
  end

  def self.all # .all returns all instances of Owner that have been created
    @@all
  end

  def self.count # .count returns the number of owners that have been created
    @@all.count
  end

  def self.reset_all # .reset_all can reset the owners that have been created
    @@all.clear
  end

  def cats # returnsa a collection of all the cats that belong to the owner
    Cat.all.find_all { |cat| cat.owner == self }
  end

  def dogs # returnsa a collection of all the dogs that belong to the owner
    Dog.all.find_all { |dog| dog.owner == self }
  end
  
  def buy_cat(new_cat) # can buy a cat that is an instance of the Cat class, knows about its cats
    Cat.new(new_cat, self)
  end

  def buy_dog(new_dog) # can buy a dog that is an instance of the Dog class, knows about its dogs
    Dog.new(new_dog, self)
  end

  def walk_dogs # walks the dogs which makes the dogs' moods happy
    Dog.all.each { |dog| dog.mood = "happy" }
  end

  def feed_cats # feeds cats which makes the cats' moods happy
    Cat.all.each { |cat| cat.mood = "happy" }
  end

  def sell_pets # can sell all its pets, which makes them nervous, can sell all its pets, which leaves them without an owner
    self.cats.each { |cat| cat.mood = "nervous" }
    self.cats.each { |cat| cat.owner = nil }
    self.dogs.each { |dog| dog.mood = "nervous" }
    self.dogs.each { |dog| dog.owner = nil }
  end

  def list_pets # can list off its pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
  
end