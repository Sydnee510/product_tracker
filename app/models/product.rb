class Product <  ApplicationRecord
   belongs_to :category, optional: true
   belongs_to :user, optional: true
     validates :name, presence: true, uniqueness:true
     validates :description, presence: true
     validates :price, presence: true
     validates :category, presence: true

     scope :searched, ->(search_term) { where("content LIKE ?", "%#{search_term}%") }
    
end