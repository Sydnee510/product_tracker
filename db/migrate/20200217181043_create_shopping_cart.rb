class CreateShoppingCart < ActiveRecord::Migration[6.0]
  def change
    create_table :shopping_carts do |t|
      t.string :item_list
      t.integer :total
      t.timestamps null: false
      t.belongs_to :user
    end
  end
end
