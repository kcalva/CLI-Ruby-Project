#recipes.rb
class Recipes
  attr_accessor :name, :ingredient, :instructions, :category

  def initialize(name,ingredient,instructions,category,recipes)
	  @name = name
	  @ingredient = ingredient
	  @instructions = instructions
		@category = category
		@recipes = recipes
  end

  # Methods for adding, viewing, updating, or deleting recipes
	def add_recipe
		puts "Enter the name of the recipe: "
		name = gets.chomp
		
		puts "Enter the ingredients (separated by commas): "
		ingredient = gets.chomp.split(",")

		puts "Enter the instructions: "
		instructions = gets.chomp

		puts "Enter the category: "
		category = gets.chomp

		new_recipe = Recipes.new(name,ingredient,instructions,category,@recipes)
		@recipes << new_recipe

		new_recipe

	end
	
	def view_recipe(recipe_name, recipes)
		recipe_found = false
		recipes.each{|recipe|
			if recipe.name == recipe_name
				recipe_found = true
				puts "Name: #{recipe_name}"
				puts "Ingredients: #{recipe.ingredient.join(", ")}"
				puts "Instructions: #{recipe.instructions}"
				puts "Category: #{recipe.category}"
			end
		}

		if !recipe_found
			puts "Recipe not found!"
		end
	end

	def update_recipe(recipe_name, recipes)
		recipe_found = false
		recipes.each{|recipe|
			if recipe.name == recipe_name
				recipe_found = true
				
				puts "Enter the new name of the recipe: "
				recipe.name = gets.chomp

				puts "Enter the new ingredients (separated by commas): "
				recipe.ingredient = gets.chomp.split(",")

				puts "Enter the new instructions: "
				recipe.instructions = gets.chomp

				puts "Enter the new category: "
				recipe.category = gets.chomp

				puts "Recipe updated successfully"
			end
		}
		if !recipe_found
			puts "Recipe not found!"
		end
	end

	def delete_recipe(recipe_name, recipes)
		recipe_found = false
		recipes.each_with_index{|recipe,index|
			if recipe.name == recipe_name
				recipe_found = true
				recipes.delete_at(index)
				puts "Recipe deleted successfully!"
			end
		}

		if !recipe_found
			puts "Recipe not found!"
		end
	end

end

recipes = []

loop do
	
	puts "\nWelcome to the Recipe Manager!"
	puts "\nWhat would like to do?"
	puts "1. Add a new recipe"
	puts "2. View a recipe"
	puts "3. Update a recipe"
	puts "4. Delete a recipe"
	puts "Type 'exit' to end the program"


	choice = gets.chomp.downcase

	case choice
	when "1"
		recipe = Recipes.new("","","","")
		new_recipe = recipe.add_recipe
		recipes << new_recipe

	when "2"
		if recipes.empty?
			puts "There are no recipes available to view"
		else
			puts "Enter the name of the recipe you want to view: "
			recipe_name = gets.chomp

			recipes_obj = Recipes.new("","","","")
			recipes_obj.view_recipe(recipe_name,recipes)
		end
	when "3"
		if recipes.empty?
			puts "There are no recipes available to update"
		else
			puts "Enter the name of the recipe you want to update: "
			recipe_name = gets.chomp

			recipes_obj = Recipes.new("","","","")
			recipes_obj.update_recipe(recipe_name,recipes)
		end
	when "4"
		if recipes.empty?
			puts "There are no recipes available to delete"
		else
			puts "Enter the name of recipe you want to delete: "
			recipe_name = gets.chomp

			recipes_obj = Recipes.new("","","","")
			recipes_obj.delete_recipe(recipe_name,recipes)
		end
	when "exit"
		break
	else
		puts "Invalid choice. Please enter a valid option"
	end
end	
