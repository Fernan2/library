class Lendings < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :lending_count, :integer, default: 0
  end
end
