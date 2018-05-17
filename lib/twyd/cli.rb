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
    city = nil

    while city != "exit"
      puts "Now, tell me the city that you'd like to look up:"
      city = gets.strip.downcase
      case city
      when "1"
        puts "More information on Deal 1"
      when "2"
        puts "More on 2"
      end
    end
    # Twyd::Scraper.get_cities
    # Twyd::Scraper.find_city(city) ? list_activities : choose_city
  end

  def list_activities
    puts "list"
  end

  def goodbye
    puts "Have a fun way with your dog(s). Goodbye!"
  end

end
