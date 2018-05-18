class Twyd::Scraper

  # Scrapes the name and individual websites for the most popular cities in BrigFido's website
  def self.get_cities
    html = Nokogiri::HTML(open("https://www.bringfido.com/destination/popular/"))
    html.css("div .info h2 a").map do |cities|
      @city = Twyd::City.new
      @city.name, @city.state = cities.text.split(", ")
      @city.website = cities.attribute("href").value.gsub("/destination/city/", "")
      @city
    end
  end

  # Scrapes list of activities per city
  def self.get_activities(path)
    html = Nokogiri::HTML(open(path))
    html.css("div .info h2 a").map do |activities|
      @activity = Twyd::Activity.new
      @activity.name = activities.text
      @activity.website = activities.attribute("href").value
      @activity
    end
  end

  # Scrapes description of specific activity
  def self.describe_activities(path)
    html = Nokogiri::HTML(open(path))
    html.css("div .detail-area p").map do |a|
      @activity.description = a.text
    end
    html.css("div .property-info span").map do |b|
      @activity.address = b.text
    end
  end

end
