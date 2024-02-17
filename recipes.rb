#recipes.rb
class Recipes
  attr_accessor :name, :ingredient, :instructions, :category

  def initialize(name,ingredient,instructions,category)
	  @name = name
	  @ingredient = ingredient
	  @instructions = instructions
		@category = category
  end

  # Methods for adding, viewing, updating, or deleting recipes
	def add_recipe
		pp "Enter the name of the recipe: "
		@name = gets.chomp
		
		pp "Enter the ingredients (separated by commas): "
		@ingredient = gets.chomp.split(",")

		pp "Enter the instructions: "
		@instructions = gets.chomp

		pp "Enter the category: "
		@category = gets.chomp

		Recipes.new(@name,@ingredient,@instructions,@category)

	end
	
	def view_recipe(recipe_name, recipes)
		if recipes.empty?
			pp "There are no recipes available to view"
		else
			recipe_found = false
			recipes.each{|recipe|
				if recipe.name == recipe_name
					pp "Name: #{recipe_name}"
					pp "Ingredients: #{recipe.ingredient.join(", ")}"
					pp "Instructions: #{recipe.instructions}"
					pp "Category: #{recipe.category}"
					recipe_found = true
					break
				end
			}
		end

		if !recipe_found
			pp "Recipe not found!"
		end
	end

end

recipes = []

loop do
	puts "\n"
	pp "Welcome to the Recipe Manager!"
	puts "\n"
	pp "What would like to do?"
	pp "1. Add a new recipe"
	pp "2. View a recipe"
	pp "Type 'exit' to end the program"


	choice = gets.chomp.downcase

	case choice
	when "1"
		recipe = Recipes.new("","","","")
		new_recipe = recipe.add_recipe
		recipes << new_recipe

	when "2"
		pp "Enter the name of the recipe you want to view: "
		recipe_name = gets.chomp

		recipes_obj = Recipes.new("","","","")
		recipes_obj.view_recipe(recipe_name,recipes)
	when "exit"
		break
	else
		pp "Invalid choice. Please enter a valid option"
	end
end	
