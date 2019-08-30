require './config/environment'

class ResInfo::Restaurant

  attr_accessor :title, :location, :times, :description

  @@all = []

  def self.new_from_scraper(res)
     self.new(
      res.css("a.restaurant-card__anchor").attribute("aria-label").value,
      res.css("span.restaurant-card__media-text").text.gsub(/\s+/, ""),
      res.css("span.text-brand").text
      # descrpition: res.css("a.restaurant-card__anchor").attribute("aria-label").value
    )
    # binding.pry
  end

  def initialize(title=nil, location=nil, times=nil, description=nil)
    @title = title
    @location = location
    @times = times
    @description = description
    @@all << self
  end

  def self.all
    @@all
  end

#need to creat a new instance of Restuarant here

  def title
   #givea the instance title
  end

  def location
    #
  end

 end


  # def location
  #  #returns a list of resturant location
  #  get_cards.each {|r| puts r.css("a.restaurant-card__media span.restaurant-card__media-text").text}
  # end
  #
  # def description
  #
  # end
  #
  # def times
  #
  # end

  # def card
  #  @card ||= ResInfo::Scraper.new.get_card
  # end
