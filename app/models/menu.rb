class Menu < ApplicationRecord
  belongs_to :restaurant
  has_many :menu_items
  validates :title, presence: true
end
