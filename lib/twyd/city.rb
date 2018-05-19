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

  def self.find_by_name(name)
    self.all.detect do |n|
      n.name.downcase == name.downcase
    end
  end

end
