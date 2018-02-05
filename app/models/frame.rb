class Frame < ApplicationRecord
  belongs_to :turn
  belongs_to :member
end
