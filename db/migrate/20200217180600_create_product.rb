class CreateProduct < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.integer :price
      t.timestamps null: false
      t.integer :category_id
      t.integer :user_id
  
     
    end
  end
end
