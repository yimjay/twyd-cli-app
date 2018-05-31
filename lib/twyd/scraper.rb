class Twyd::Scraper

  # Scrapes the name and individual websites for the most popular cities in BrigFido's website
  def self.get_cities
    html = Nokogiri::HTML(open("https://www.bringfido.com/destination/popular/"))
    html.css("div .info h2 a").each do |cities|
      @city = Twyd::City.new
      @city.name, @city.state = cities.text.split(", ")
      @city.website = "https://www.bringfido.com/attraction/city/" + cities.attribute("href").value.gsub("/destination/city/", "")
      @city
    end
  end

  def self.make_path(input)
    # when input 1..50 assign path = city.website
  end

  # Scrapes list of activities for given city
  def self.get_activities
    html = Nokogiri::HTML(open(@path))
    html.css("div .info h2 a[itemprop='url']").map do |activities|
      @activity = Twyd::Activity.new
      @activity.name = activities.text
      @activity.website = "https://www.bringfido.com" + activities.attribute("href").value
      @activity
    end
  end

  # Scrapes description, address, and rating of specific activity for given link
  def self.describe_activities(path)
    html = Nokogiri::HTML(open(path))
    html.css("div .property-info a span").map do |a|
      @activity.address = a.text
    end
    html.css("div[itemprop='description'] p").map do |b|
      @activity.description = b.text
    end
    html.css("div .reviews-average p").map do |c|
      @activity.rating = c.text.strip.gsub(/\n+/, " ")
    end
    @activity
  end

  # Prints activity details
  # move to CLI class, might take an argument that's an activity
  def self.print_activities
    puts ""
    puts "#{@activity.description}"
    puts ""
    puts "#{@activity.rating} It is located at #{@activity.address}."
  end

end
