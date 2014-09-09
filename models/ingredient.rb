class Ingredient < ActiveRecord::Base
  belongs_to :recipe
  # ...
end














# require 'pry'
# class Ingredient
#   attr_reader :name

#   def initialize(ingredient)



#     # ingredients = []
#     # id = params[:id]
#     # connection = PG.connect(dbname: 'recipes_')
#     #   results = connection.exec('SELECT * FROM ingredients WHERE recipe_id = $1', [id])
#     #   connection.close
#     #   results.each do |ingredient|
#     #   ingredients << Ingredient.new(ingredient)
#     # end
#     # recipes
#     @name = ingredient["name"]
#   end

#   def self.find(id)
#     ingredients = []

#     connection = PG.connect(dbname: 'recipes_')
#       results = connection.exec('SELECT * FROM ingredients WHERE recipe_id = $1', [id])
#     connection.close
#       results.each do |ingredient|
#       ingredients << Ingredient.new(ingredient)
#     end
#     ingredients
#   end
# end
