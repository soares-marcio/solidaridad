class NeediesHasCategory < ApplicationRecord
  belongs_to :category
  belongs_to :needy
end
