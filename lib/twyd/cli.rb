class Twyd::CLI

  def call
    welcome
    choose_city
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
    input = nil

    while input != "exit"
      puts "Here's a list of available cities:"
      puts ""
      @cities.each.with_index(1) do |city, i|
        puts "#{i}. #{city.name}"
      end
      puts ""
      puts "Now, choose a city:"
      input = gets.strip
      case input
      when "1"
        @path = "https://www.bringfido.com/attraction/city/las_vegas_nv_us/"
        list_activities
      end
    end
  end

  # def make_path
  #
  # end

  def list_activities
    @activities = Twyd::Scraper.get_activities(@path)
    @activities.each do |a|
      puts a
    end
  end

  def goodbye
    puts "Have a fun day with your dog(s). Goodbye!"
  end

end
