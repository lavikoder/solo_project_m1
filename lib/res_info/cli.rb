require 'pry'
require 'tty-prompt'
require 'tty-font'
require 'nokogiri'

class ResInfo::CLI

  def initialize
    @prompt = TTY::Prompt.new
    @font = TTY::Font.new(:doom)
  end


  def display_header
    pastel = Pastel.new
    puts pastel.blue.on_red.bold(@font.write("10 Restaurants 4"))
    greet
  end

  def greet
    puts "\n" "\u{1f373}" " Hello, welcome to 10 Restaurants 4"
    list_restuarants
  end

  def list_restuarants
    #this method will list all resturants in format 1. "title", 2."tilte" etc
    #this method should also pull information from resturants class then format, therefore
    ResInfo::Restaurant.all.select {|res| puts res.title}
  end
end

ResInfo::CLI.new.display_header
  #In this app, we are going to retrive information about some of your favourite resturants in the London City.
  #The CLI will simply allow for the user to have basic information about resturants: title, location and a small descrpition of cuisene.
  #the user will be able to chose a number 1-10, which will have information of the top 10 resturants in a given area
  #things to think about: Where are the locations of resturants?
  #how do you want this information to be displayed?
  #this is all going to be readble material so user won't be able to change anything. Think about your classes?
  #Lastly think about how user friendly this is going to be, make sure this is very simple for the user to use and is easy to exit out of
  #looping features? can they research more places before being prompted to enter? Let the games begin!


  # res = Restaurants.all { |r| puts r.title }
  # loop do
  #   i += 1
  #   res.each { |c| puts '#{i}'.c }
  #     break if
  #       i = 10
  #   end
  # end



  #
  # def create_me
  #   name = @prompt.ask("Please enter your name..")
  #   @user = User.create_user(name)
  #   food_available
  # end
  #
  # def food_available
  #   puts "What ingredients do you have available?"
  #   list_groups
  # end
  #
  # def list_groups
  #   @food_choice = @prompt.select("Select your food group", %w(Dairy
  #   Sugars Carbohydrates Protien Fruits/Veg))
  #   # binding.pry
  #   group_search
  # end
  #
  # def group_search
  #   if @food_choice == "Dairy"
  #     dairy_foods
  #   elsif @food_choice == "Sugars"
  #     sugars_foods
  #   elsif @food_choice == "Carbohydrates"
  #     carbohydrates_foods
  #   elsif @food_choice == "Protien"
  #     protien_foods
  #   elsif @food_choice == "Fruits/Veg"
  #     fandf_foods
  #   else
  #     puts "please choose another food group"
  #   end
  # end
  #
  # def dairy_foods
  #   @dairy_choice = @prompt.select("Select your dairy product", %w(Milk Cheese Yoghurt))
  #   group_choice(@dairy_choice)
  # end
  #
  # def sugars_foods
  #   @sugar_choice = @prompt.select("Select your sugar product", %w(Whitesugar Syrup Chocolate Icing))
  #   group_choice(@sugar_choice)
  # end
  #
  # def carbohydrates_foods
  #   @carb_choice = @prompt.select("Select your carb product", %w(Pasta Bread Rice))
  #   group_choice(@carb_choice)
  # end
  #
  # def protien_foods
  #   @protien_choice = @prompt.select("Select your protien product", %w(Chicken Fish Beans))
  #   group_choice(@protien_choice)
  # end
  #
  # def fandf_foods
  #   @ff_choice = @prompt.select("Select your fruit and veg product", %w(Apples Banana Broccoli))
  #   group_choice(@ff_choice)
  # end
  #
  # def group_choice(choice)
  #   @user.kitchen << choice
  #   if @user.kitchen.length == 5
  #     print_foods
  #   else
  #     puts "What else is in your Kitchen??"
  #     list_groups
  #   end
  #   # binding.pry
  # end
  #
  # def print_foods
  #   puts "Great! Here are your list of ingredients.."
  #   @user.kitchen.each  {|i|  puts i  }
  #   # binding.pry
  #   # choose_recipe
  # ending
  # end
  #
  # def ending
  #   puts "Thanks, we will update your kitchen and give you a selection of meals!!!!"
  # end
