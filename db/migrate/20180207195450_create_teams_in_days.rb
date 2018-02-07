class CreateTeamsInDays < ActiveRecord::Migration[5.1]
  def change
    create_table :teams_in_days do |t|
      t.references :day, foreign_key: true
      t.references :team, foreign_key: true

      t.timestamps
    end
  end
end
