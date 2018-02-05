class TeamInRound < ApplicationRecord
  belongs_to :round
  belongs_to :team
end
