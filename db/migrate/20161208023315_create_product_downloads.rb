class CreateProductDownloads < ActiveRecord::Migration[5.0]
  def change
    create_table :product_downloads do |t|
      t.integer :product_id, :download_id
      t.timestamps
    end
  end
end
