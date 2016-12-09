class AddPublishingToBook < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :editorial, :string
    add_column :books, :isbn, :string, unique: true, index: true
  end
end
