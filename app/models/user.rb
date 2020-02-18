class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

         def self.from_omniauth(auth)
          where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
            user.provider = auth.provider
            user.username = auth.info.name 
            user.uid = auth.uid 
            user.email = auth.info.email
            user.password = Devise.friendly_token[0,20]
        end
      end

      # has_many :products
      # has_many :categories
      # has_many :products, through: :categories
      # has_many :orders, through: :products
      # has_many :categories, through: :products
      # has_many :shopping_carts, through: :products
end
