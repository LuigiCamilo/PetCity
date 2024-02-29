class AddColumnsToProducts < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :brand, :string
    add_column :products, :pet, :string
    add_column :products, :category, :string
  end
end
