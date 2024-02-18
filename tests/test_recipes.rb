require 'minitest/autorun'
require './recipes'

class TestRecipes < Minitest::Test
  def setup
    @recipes = []
    @recipe_manager = Recipes.new("", "", "", "", @recipes)
  end

  def test_add_recipe
    input = StringIO.new("Chocolate Cake\nFlour, Sugar, Cocoa Powder\nMix ingredients and bake\nDessert\n")
    $stdin = input
  
    @recipe_manager.add_recipe
  
    # Trim extra spaces from the ingredients
    actual_ingredients = @recipe_manager.instance_variable_get(:@recipes)[0].ingredient.map(&:strip)
  
    assert_equal 1, @recipe_manager.instance_variable_get(:@recipes).length
    assert_equal "Chocolate Cake", @recipe_manager.instance_variable_get(:@recipes)[0].name
    assert_equal ["Flour", "Sugar", "Cocoa Powder"], actual_ingredients
    assert_equal "Mix ingredients and bake", @recipe_manager.instance_variable_get(:@recipes)[0].instructions
    assert_equal "Dessert", @recipe_manager.instance_variable_get(:@recipes)[0].category
  end

  def test_view_recipe_found
    recipe = Recipes.new("Pasta", ["Pasta", "Tomato Sauce"], "Boil pasta, mix with sauce", "Main Course",@recipes)
    @recipes << recipe

    input = StringIO.new("Pasta\n")
    $stdin = input

    assert_output("Name: Pasta\nIngredients: Pasta, Tomato Sauce\nInstructions: Boil pasta, mix with sauce\nCategory: Main Course\n") { @recipe_manager.view_recipe("Pasta", @recipes) }
  end

  def test_view_recipe_not_found
    input = StringIO.new("Soup\n")
    $stdin = input

    assert_output("Recipe not found!\n") { @recipe_manager.view_recipe("Soup", @recipes) }
  end

  def teardown
    $stdin = STDIN
  end
end
