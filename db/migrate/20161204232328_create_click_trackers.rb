class CreateClickTrackers < ActiveRecord::Migration[5.0]
  def change
    create_table :click_trackers do |t|
      t.string :name
      t.string :url
      t.string :slug
      t.timestamps
    end
  end
end
