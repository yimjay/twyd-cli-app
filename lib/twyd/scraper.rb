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

  # Scrapes list of activities per city
  def self.get_activities(path)
    html = Nokogiri::HTML(open(path))
    html.css("div #results-list div").map do |activities|
      @activity = Twyd::Activity.new
      @activity.name = activities.attribute("data-name").value
      @activity.type = activities.attribute("data-type").value
      @activity.rating = activities.attribute("data-rating").value
      @activity
    end
  end
  #get description of specific activity

end
