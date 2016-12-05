class AddSlugToClickTrackers < ActiveRecord::Migration[5.0]
  def change
    add_index :click_trackers, :slug, unique: true
  end
end
