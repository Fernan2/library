class RemoveEditorialFromBooks < ActiveRecord::Migration[5.0]
  def change
    remove_column :books, :editorial, :string
  end
end
