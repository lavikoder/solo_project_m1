class User

  @@all = []

  attr_accessor :name, :kitchen

 def initialize(name)
   @name = name
   @kitchen = []
 end

 def self.all
   @@all
 end

 def save
    @@all << self
  end

  def self.create_user(name)
   new_user = User.new(name)
   new_user.save
   new_user
  end

  # def ingredients
  #   #this is what the user choses from the api or website
  #
  # end

 end
