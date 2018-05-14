require "rubygems"
require "nokogiri"
require "open-uri"

  # Scrapes the name and individual websites for the most popular cities in BrigFido's website
  def get_cities
    html = Nokogiri::HTML(open("https://www.bringfido.com/destination/popular/"))
    cities = {}
    html.css("div .info h2 a").each do |city|
      cities[city.text] = {
        :website => city.attribute("href").value
      }
    end
    puts cities
  end

  get_cities
