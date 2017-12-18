class UsersHasNeedy < ApplicationRecord
  belongs_to :user
  belongs_to :needy
end
