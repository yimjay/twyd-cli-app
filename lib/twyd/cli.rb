class Twyd::CLI

  def call
    welcome
    choose_city
    make_path
    # list_activities
    goodbye
  end

  def welcome
    puts " _________ ____      ____ ____  ____ ______    "
    puts "|  _   _  |_  _|    |_  _|_  _||_  _|_   _ `.  "
    puts '|_/ | | \_| \ \  /\  / /   \ \  / /   | | `. \ '
    puts '    | |      \ \/  \/ /     \ \/ /    | |  | | '
    puts '   _| |_      \  /\  /      _|  |_   _| |_.'+"' /"
    puts '  |_____|      \/  \/      |______| |______.'"'"
    puts ""
    puts "Welcome to TWYD (Travel With Your Dog)! This app was made by someone who loves exploring new cities with her dog, Gretchen, in the hopes that you will keep exploring the world with your dog(s) too."
    puts ""
  end

  def choose_city
    @cities = Twyd::Scraper.get_cities #array of City object instances
    @input = nil
    puts "----------------------------------"
    puts "Here's a list of available cities:"
    puts "----------------------------------"
    puts ""
    @cities.each.with_index(1) do |city, i|
      puts "#{i}. #{city.name}"
    end
    puts ""
    puts "------------------"
    puts "Now, choose a city:"
    puts "------------------"
    @input = gets.strip
  end

  def make_path
    case @input.to_i
      when (1..50)
        @path = "https://www.bringfido.com/attraction/city/" + @cities[@input.to_i - 1].website
        puts @path
        # @path = "https://www.bringfido.com/attraction/city/las_vegas_nv_us/"
      end
  end

  def list_activities
    @activities = Twyd::Scraper.get_activities(@path)
    puts ""
    puts "Here is a list of activities popular in #{@cities[@input.to_i - 1].name}"
    @activities.each.with_index(1) do |a, i|
      puts "#{i} #{a.name}"
    end
  end

  def goodbye
    puts "------------------------------------------"
    puts "Have a fun day with your dog(s). Goodbye!"
    puts "------------------------------------------"
  end

end
