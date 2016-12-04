class AddBodyCloseToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :body_close, :text
  end
end
