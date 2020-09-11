class AddCookIdToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column  :recipes, :cook_id, :integer
  end
end
