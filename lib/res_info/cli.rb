require 'pry'
require 'tty-prompt'
require 'tty-font'
require_relative './user.rb'

class ResInfo::CLI


  def initialize
    @prompt = TTY::Prompt.new
    @font = TTY::Font.new(:doom)
  end


  def display_header
    pastel = Pastel.new
    puts pastel.blue.on_red.bold(@font.write("CUC&co"))
    greet
  end

  def greet
    puts "\n" "\u{1f373}" " Hello, welcome to C.U.C. & co"
    create_me
  end

  def create_me
    name = @prompt.ask("Please enter your name..")
    @user = User.create_user(name)
    food_available
  end

  def food_available
    puts "What ingredients do you have available?"
    list_groups
  end

  def list_groups
    @food_choice = @prompt.select("Select your food group", %w(Dairy
    Sugars Carbohydrates Protien Fruits/Veg))
    # binding.pry
    group_search
  end

  def group_search
    if @food_choice == "Dairy"
      dairy_foods
    elsif @food_choice == "Sugars"
      sugars_foods
    elsif @food_choice == "Carbohydrates"
      carbohydrates_foods
    elsif @food_choice == "Protien"
      protien_foods
    elsif @food_choice == "Fruits/Veg"
      fandf_foods
    else
      puts "please choose another food group"
    end
  end

  def dairy_foods
    @dairy_choice = @prompt.select("Select your dairy product", %w(Milk Cheese Yoghurt))
    group_choice(@dairy_choice)
  end

  def sugars_foods
    @sugar_choice = @prompt.select("Select your sugar product", %w(Whitesugar Syrup Chocolate Icing))
    group_choice(@sugar_choice)
  end

  def carbohydrates_foods
    @carb_choice = @prompt.select("Select your carb product", %w(Pasta Bread Rice))
    group_choice(@carb_choice)
  end

  def protien_foods
    @protien_choice = @prompt.select("Select your protien product", %w(Chicken Fish Beans))
    group_choice(@protien_choice)
  end

  def fandf_foods
    @ff_choice = @prompt.select("Select your fruit and veg product", %w(Apples Banana Broccoli))
    group_choice(@ff_choice)
  end

  def group_choice(choice)
    @user.kitchen << choice
    if @user.kitchen.length == 5
      print_foods
    else
      puts "What else is in your Kitchen??"
      list_groups
    end
    # binding.pry
  end

  def print_foods
    puts "Great! Here are your list of ingredients.."
    @user.kitchen.each  {|i|  puts i  }
    # binding.pry
    choose_recipe
  end

  # def choose_recipe
  #   @user.kitchen.each {|i|    }
  # end

  #

end
