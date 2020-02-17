class Product <  ActiveRecord::Base
    belongs_to :category, optional: true
    belongs_to :user, optional: true
    belongs_to :order, optional: true
    belongs_to :shopping_cart, optional: true
end