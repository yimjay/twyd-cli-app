class Twyd::CityScraper
  # Scrapes the name and individual websites for the most popular cities in BrigFido's website
  attr_accessor :cities

  def initialize
    @cities = {}
  end

  def get_cities
    html = Nokogiri::HTML(open("https://www.bringfido.com/destination/popular/"))
    html.css("div .info h2 a").each do |city|
      @cities[city.text] = {
        :website => city.attribute("href").value
      }
    end
  end

  def list_cities
    @cities
  end

  def find_city(city)
    @cities[city] != nil
  end


end
