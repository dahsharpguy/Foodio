class AddSlugToRecipe < ActiveRecord::Migration
  def change
    add_column :recipes, use: :slugged
    add_index :recipes, :slug
  end
end
