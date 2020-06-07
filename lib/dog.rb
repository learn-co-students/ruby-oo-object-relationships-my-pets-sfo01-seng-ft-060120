class Dog

  attr_accessor :owner, :mood # can change its owner, can change its mood
  attr_reader :name # can't change its name

  @@all = []

  def initialize (dog_name, owner_name) # initializes with a name and an Owner, initializes with a nervous mood
    @name = dog_name
    @owner = owner_name
    @mood = "nervous"
    @@all << self
  end

  def self.all # knows all the dogs
    @@all
  end

end