class Category < ApplicationRecord
    has_many :products
    has_many :users, through: :products 
   validates :title, presence: true, uniqueness:true
   

   scope :search_product, ->(product_search) { where("name LIKE ?", "%#{product_search}%") }
end