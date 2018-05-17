class Twyd::Activity
  attr_accessor :name, :type

  # Add all instances of Activity
  @@all = []

  # Initialize instance
  def initialize(name, type)
    @name = name
    @type = type
    @@all < self
  end

  # Make all array readable
  def self.all
    @@all
  end

end
