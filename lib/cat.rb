class Cat
  
  attr_accessor :owner, :mood #can change its owner
  attr_reader :name # can't change its name

  @@all = []

  def initialize(cat_name, owner) # initializes with a name and an Owner
    @name = cat_name
    @owner = owner
    @mood = "nervous"
    @@all << self
  end

  def self.all # knows all the cats
    @@all
  end

end