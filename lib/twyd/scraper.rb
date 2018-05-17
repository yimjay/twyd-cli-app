class Twyd::Scraper

  # Scrapes the name and individual websites for the most popular cities in BrigFido's website
  def self.get_cities
    html = Nokogiri::HTML(open("https://www.bringfido.com/destination/popular/"))
    html.css("div .info h2 a").map do |cities|
      @city = Twyd::City.new
      @city.name, @city.state = cities.text.split(", ")
      @city.website = cities.attribute("href").value
      @city
    end
  end

  def list_cities
    @cities
  end

  def find_city(city)
    @cities[city] != nil
  end

  #get list of activities

  #get description of specific activity

end
