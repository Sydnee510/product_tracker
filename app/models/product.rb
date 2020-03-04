class Product <  ApplicationRecord
   belongs_to :category, optional: true
   belongs_to :user, optional: true

   accepts_nested_attributes_for :category, reject_if: :all_blank
     validates :name, presence: true, uniqueness:true
     validates :description, presence: true
     validates :price, presence: true
     validates :category, presence: true

     scope :searched, ->(search_term) { where("name LIKE ?", "%#{search_term}%") }
     scope :expensive, ->{ where("price > 50")} 
end