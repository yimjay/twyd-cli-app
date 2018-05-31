class Twyd::CLI

  def call
    welcome
    Twyd::Scraper.get_cities
    list_cities
    choose_city
    list_activities
    continue
  end

  def welcome
    puts " _________ ____      ____ ____  ____ ______    ".colorize(:green)
    puts "|  _   _  |_  _|    |_  _|_  _||_  _|_   _ `.  ".colorize(:green)
    puts '|_/ | | \_| \ \  /\  / /   \ \  / /   | | `. \ '.colorize(:green)
    puts '    | |      \ \/  \/ /     \ \/ /    | |  | | '.colorize(:green)
    puts '   _| |_      \  /\  /      _|  |_   _| |_.'.colorize(:green)+"' /".colorize(:green)
    puts '  |_____|      \/  \/      |______| |______.'"'".colorize(:green)
    puts ""
    puts "Welcome to TWYD (Travel With Your Dog)! This app was made by someone who loves exploring new cities with their dog, Gretchen, in the hopes that you will be inspired to explore the world with your dog(s) too.".colorize(:magenta)
    puts ""
    puts "Just a second while I play tug-of-war with Gretchen...".colorize(:magenta)
    puts ""
  end

  def list_cities
    cities = Twyd::City.sort_cities
    puts "----------------------------------"
    puts "Here's a list of available cities:".colorize(:green)
    puts "----------------------------------"
    puts ""
    # prints a list of cities scraped
    cities.each.with_index(1) do |city, i|
      puts "#{i}. #{city.name},#{city.state}"
    end
    puts ""
  end

  def choose_city
    puts "-------------------------------------"
    puts "Which city would you like to look up?".colorize(:green)
    puts "-------------------------------------"
    puts ""
    # number validation for city option
    number_checker
  end

  def number_checker
    input = gets.strip
    if input.to_i.between?(1, 50) # 1 to 50 inclusive
      activities = Twyd::Scraper.get_activities(@path)
    elsif input.downcase == "exit"
      goodbye
    else
      puts "Sorry! I don't have information about that. Try again.".colorize(:red)
      number_checker
    end
  end

  # def make_path(input)
  #   case input.to_i
  #     when (1..50)
  #       # creates the specific city's link for Scraper.get_activities
  #       path = "https://www.bringfido.com/attraction/city/" + @cities[input.to_i - 1].website
  #     end
  # end

  def list_activities
    activities = Twyd::Scraper.get_activities(@path)
    puts ""
    puts "--------------------------------------------------"
    puts "Here is a list of activities popular in #{@cities[@input.to_i - 1].name}:".colorize(:green)
    puts "--------------------------------------------------"
    puts ""
    # prints activities available in city chosen by user
    @activities.each.with_index(1) do |a, i|
      puts "#{i}. #{a.name}"
    end
  end

  def continue
    puts ""
    puts "-------------------------------"
    puts "What would you like to do now?".colorize(:green)
    puts "-------------------------------"
    puts ""
    puts "1. Learn more about an activity"
    puts "2. Look up a different city"
    puts "3. Exit the program"
    puts ""
    @input = gets.strip.downcase
    case @input
    when "1"
      puts ""
      puts "--------------------------------------------------"
      puts "Which activity would you like to learn more about?".colorize(:green)
      puts "--------------------------------------------------"
      puts ""
      @input = gets.strip
      @path = "https://www.bringfido.com" + @activities[@input.to_i - 1].website
      Twyd::Scraper.describe_activities(@path)
      Twyd::Scraper.print_activities
      continue
    when "2"
      choose_city
      make_path
      list_activities
      continue
    when "3"
      goodbye
    when "exit"
      goodbye
    else
      puts "1, 2, 3. Easy as A, B,... Wait. That's not right. Please choose 1, 2, or 3.".colorize(:red)
      continue
    end
  end


  def goodbye
    puts "-----------------------------------------"
    puts "Have a fun day with your dog(s). Goodbye!".colorize(:green)
    puts "-----------------------------------------"
  end

end
