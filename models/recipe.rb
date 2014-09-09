require_relative 'ingredient'
require 'pry'
class Recipe
  attr_reader :id, :name, :description

  def initialize(recipe)
    @id = recipe["id"]
    @name = recipe["name"]
    @instructions = recipe["instructions"]
    @description = recipe["description"]
    @ingredients = []
  end

  def self.all
    recipes = []

    connection = PG.connect(dbname: 'recipes_')
      results = connection.exec('SELECT * FROM recipes ORDER BY name')
      connection.close
      results.each do |recipe|
      recipes << Recipe.new(recipe)
    end
    recipes
  end

  def self.find(id)
    recipe = []

    connection = PG.connect(dbname: 'recipes_')
      results = connection.exec('SELECT * FROM recipes WHERE id = $1 ORDER BY name', [id])
    connection.close
      # results.to_a
      results.each do |details|
      recipe << Recipe.new(details)
    end
    recipe.first
  end

  def instructions
    if @instructions == nil
      @instructions = "This recipe doesn't have any instructions."
    else
      @instructions
    end
  end

  def description
    if @description == nil
      @description = "This recipe doesn't have a description."
    else
      @description
    end
  end

  def ingredients
    @ingredients = Ingredient.find(@id)
  end
end
