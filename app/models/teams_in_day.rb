class TeamsInDay < ApplicationRecord
  belongs_to :day
  belongs_to :team
end
