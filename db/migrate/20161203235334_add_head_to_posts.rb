class AddHeadToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :head, :text
  end
end
