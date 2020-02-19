class CreateCategory < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :title
      t.timestamps null: false
      
    end
  end
end
