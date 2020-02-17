class CreateCategory < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :title
      t.timestamps null: false
      t.belongs_to :user
    end
  end
end
