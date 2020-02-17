class Product <  ActiveRecord::Base
    belongs_to :category
    belongs_to :user
    belongs_to :order
    belongs_to :shopping_cart
end