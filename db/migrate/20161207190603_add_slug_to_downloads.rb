class AddSlugToDownloads < ActiveRecord::Migration[5.0]
  def change
    add_column :downloads, :slug, :string
    add_index :downloads, :slug, unique: true
  end
end
