class AddSlugToRecipe < ActiveRecord::Migration
  def change
    add_column :recipes, :cached_slug, :string
    add_index :recipes, :slug
  end
end
