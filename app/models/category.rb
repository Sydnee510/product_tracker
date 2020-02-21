class Category < ApplicationRecord
    has_many :products
    has_many :users, through: :products 
    
    accepts_nested_attributes_for :products, reject_if: :all_blank

   validates :title, presence: true, uniqueness:true
   

   scope :search_category, ->(category_search) { where("title LIKE ?", "%#{category_search}%") }
end