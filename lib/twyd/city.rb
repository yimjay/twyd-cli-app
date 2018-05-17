class Twyd::City
  attr_accessor :name, :state, :website

  @@all = []

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end

end
