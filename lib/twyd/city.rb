class Tywd::City
  attr_accessor :city, :website

  @@all = []

  def initialize(city, website)
    @city = city
    @website = website
    @@all << self
  end

  def self.all
    @@all
  end

end
