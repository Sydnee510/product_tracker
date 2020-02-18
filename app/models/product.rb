class Product <  ApplicationRecord
   # belongs_to :category, optional: true
    belongs_to :user, optional: true
    belongs_to :order, optional: true
    belongs_to :shopping_cart, optional: true
   # has_one :category
    has_many :categories
    accepts_nested_attributes_for :categories
end