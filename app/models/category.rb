class Category < ApplicationRecord
    has_many :products
    has_many :users, through: :products 
   validates :title, presence: true, uniqueness:true
   
end