class AddDownloadsToDownloads < ActiveRecord::Migration[5.0]
  def change
    add_column :downloads, :downloads, :json
  end
end
