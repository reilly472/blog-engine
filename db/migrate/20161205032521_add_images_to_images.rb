class AddImagesToImages < ActiveRecord::Migration[5.0]
  def change
    add_column :images, :images, :json
  end
end
