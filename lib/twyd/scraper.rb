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
    html.css("div[itemprop='description'] p").map do |a|
      puts @activity.description = a.text
    end
    html.css("div .property-info a span").map do |b|
      puts @activity.address = b.text
    end
    html.css("div .reviews-average p").map do |c|
      puts @activity.rating = c.text
    end
    @activity
  end

end
