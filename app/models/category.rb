class Category < ApplicationRecord
  has_many :needies_has_category, dependent: :destroy
  has_many :needies, through: :needies_has_category 

  has_many :users_has_category, dependent: :destroy
  has_many :users, through: :users_has_category

  validates :name, presence: true
end
