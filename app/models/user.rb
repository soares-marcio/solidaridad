class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :users_has_needy, dependent: :destroy
  has_many :needies, through: :users_has_needy

  has_many :users_has_category, dependent: :destroy
  has_many :categories, through: :users_has_category

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable
end
