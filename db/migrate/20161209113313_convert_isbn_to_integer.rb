class ConvertIsbnToInteger < ActiveRecord::Migration[5.0]
  def up
    change_column :books, :isbn, :integer
  end

  def down
    change_column :books, :isbn, :string
  end
end
