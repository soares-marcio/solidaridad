class Needy < ApplicationRecord
  has_many :needies_has_category, dependent: :destroy
  has_many :categories, through: :needies_has_category

  has_many :users_has_needy, dependent: :destroy
  has_many :users, through: :users_has_needy  

  validates :address, :category_ids, presence: true
  validate :invalid_lat_lng

  private 

  def invalid_lat_lng
    if self.latitude.blank? && self.longitude.blank?
      errors.add(:address, "inválido")
    end
  end
end
