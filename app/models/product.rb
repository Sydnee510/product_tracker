class Product <  ApplicationRecord
   belongs_to :category, optional: true
   belongs_to :user, optional: true
     validates :name, presence: true
     validates :description, presence: true
     validates :price, presence: true
     validates :category, presence: true
    
end