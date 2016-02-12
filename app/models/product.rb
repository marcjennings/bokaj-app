class Product < ActiveRecord::Base
  validates :market_name, presence: true
  has_many :orders
  has_many :comments
end
