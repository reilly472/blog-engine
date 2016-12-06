class AddSlugToImages < ActiveRecord::Migration[5.0]
  def change
    add_column :images, :slug, :string
    add_index :images, :slug, unique: true
  end
end
