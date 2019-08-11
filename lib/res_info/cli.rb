require 'pry'
require 'tty-prompt'
require 'tty-font'

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
    puts "Hello, You ready to Cook??"
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
  end

  def sugars_foods
    @sugar_choice = @prompt.select("Select your sugar product", %w(Whitesugar Syrup Chocolate Icing))
  end

  def carbohydrates_foods
    @carb_choice = @prompt.select("Select your carb product", %w(Pasta Bread Rice))
  end

  def protien_foods
    @carb_choice = @prompt.select("Select your protien product", %w(Chicken Fish Beans))
  end

  def fandf_foods
    @carb_choice = @prompt.select("Select your fruit and veg product", %w(Apples Banana Broccoli))
  end

  def group_choice
    create_user(name)
    group = []
    choice = gets.chomp
    # binding.pry
  end
end
