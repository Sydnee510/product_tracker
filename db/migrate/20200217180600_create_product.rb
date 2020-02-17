class CreateProduct < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.integer :price
      t.timestamps null: false
      t.belongs_to :category
      t.belongs_to :user
      t.belongs_to :order
      t.belongs_to :shopping_cart
     
    end
  end
end
