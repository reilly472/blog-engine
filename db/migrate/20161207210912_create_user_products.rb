class CreateUserProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :user_products do |t|
      t.integer :product_id, :user_id
      t.timestamps
    end
  end
end
