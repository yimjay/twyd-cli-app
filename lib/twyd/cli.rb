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
    cities = Twyd::Scraper.get_cities #array of City object instances
    city = nil

    while city != "exit"
      puts "Now, tell me the city that you'd like to look up:"
      city = gets.strip.downcase

      cities.each do |c|
        c.name == city
        puts "Found!"
      end
    end
  end

  def list_activities
    puts "list"
  end

  def goodbye
    puts "Have a fun way with your dog(s). Goodbye!"
  end

end

end
