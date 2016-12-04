class AddCodeToSnippets < ActiveRecord::Migration[5.0]
  def change
    add_column :snippets, :code, :string
  end
end
