class AddBodyClassToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :body_class, :string
  end
end
