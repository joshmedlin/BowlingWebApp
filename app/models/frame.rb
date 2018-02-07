class Frame < ApplicationRecord
  belongs_to :turn
  belongs_to :member

  def in_round(round)

  end
end
