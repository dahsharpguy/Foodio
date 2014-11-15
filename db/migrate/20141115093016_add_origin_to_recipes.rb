class AddOriginToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :origin, :text
  end
end
