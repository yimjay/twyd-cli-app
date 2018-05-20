class Twyd::City
  attr_accessor :name, :state, :website

  # Adds all instances of City
  @@all = []

  # Initialize
  def initialize
    @@all << self
  end

  # Make all array readable
  def self.all
    @@all
  end

  # Find city by name
  def self.find_by_name(name)
    self.all.find do |n|
      n.name.downcase == name.downcase
    end
  end

end
