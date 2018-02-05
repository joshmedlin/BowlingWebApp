class CreateTeamInRounds < ActiveRecord::Migration[5.1]
  def change
    create_table :team_in_rounds do |t|
      t.references :round, foreign_key: true
      t.references :team, foreign_key: true

      t.timestamps
    end
  end
end
