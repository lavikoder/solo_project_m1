require './lib/res_info'

require 'nokogiri'
require 'httparty'
require 'pry'

class ResInfo::Scraper

  def get_cards
    url = "https://www.discoeat.co.uk/london/islington-and-kings-cross/"
    #enter url here
    unparsed_page = HTTParty.get(url)
    parsed_page = Nokogiri::HTML(unparsed_page)
    #after page is accessed, we target the individual resturant cards
    return parsed_page
  end

  def scrape_cards
    self.get_cards.css("div.d-flex ul#restaurantsList li.card-grid__item")
  end

  # res_cards = parsed_page.css("div.d-flex ul#restaurantsList li.card-grid__item")

  def make_cards
     #14 restuarants
    scrape_cards.each do |res|
      binding.pry
      ResInfo::Restaurant.new_from_scraper(res)
    end
  end
end

ResInfo::Scraper.new.make_cards









#send parsed_page as an argument to the resturant file

#e.g
=begin
def self.new_from_index_page(r)
  self.new(
    r.css("h2").text,
    "https://www.theworlds50best.com#{r.css("a").attribute("href").text}",
    r.css("h3").text,
    r.css(".position").text
    )
end

def make_restaurants
    scrape_restaurants_index.each do |r|
      WorldsBestRestaurants::Restaurant.new_from_index_page(r)
    end
  end
=end
