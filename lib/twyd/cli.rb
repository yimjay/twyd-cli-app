class Twyd::CLI

  def call
    welcome
    choose_city
  end

  def welcome
    puts " ____  ____   __   _  _  ____  __      _  _  __  ____  _  _    _  _  __   _  _  ____    ____   __    ___ "
    puts "(_  _)(  _ \ / _\ / )( \(  __)(  )    / )( \(  )(_  _)/ )( \  ( \/ )/  \ / )( \(  _ \  (    \ /  \  / __)"
    puts "  )(   )   //    \\ \/ / ) _) / (_/\  \ /\ / )(   )(  ) __ (   )  /(  O )) \/ ( )   /   ) D ((  O )( (_ \\"
    puts " (__) (__\_)\_/\_/ \__/ (____)\____/  (_/\_)(__) (__) \_)(_/  (__/  \__/ \____/(__\_)  (____/ \__/  \___/"
    puts ""
    puts "Welcome to TWYD (Travel With Your Dog)! This app was made by someone who loves exploring new cities with her dog, Gretchen, in the hopes that you will keep exploring the world with your dog(s) too."
    puts ""
  end

  def choose_city
    Twyd::CityScraper.get_cities
    puts "Now, tell me the city that you'd like to look up:"
    city = gets.strip
    Twyd::CityScraper.find_city(city) ? list_activities : choose_city
  end

  def list_activities
    puts "list"
  end

end
