class Twyd::Activity
  attr_accessor :name, :type, :rating, :website, :description, :address, :rating, :city

  # Add all instances of Activity
  @@all = []

  # Initialize instance
  def initialize
    @@all << self
  end

  # Make all array readable
  def self.all
    @@all
  end

end
