class Twyd::City
  attr_accessor :name, :state, :website, :order_num

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

  # Sort cities
  def self.sort_cities
    @@all.sort_by! do |city|
      city.name
    end
  end

  # Assign order_num
  def self.assign_num
    @@all.each.with_index do |city, i|
      city.order_num = i + 1
    end
  end

  # # Find city by name
  # def self.find_by_name(name)
  #   self.all.find do |n|
  #     n.name.downcase == name.downcase
  #   end
  # end

end
