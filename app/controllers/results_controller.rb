class ResultsController < ApplicationController
  def index
    highScoreIndividual
    lowScoreIndividual

  end

  private

  def highScoreIndividual
    round_ids = []
    Round.where(day_id: Day.where(date: Date.today).last.id).each do |round|
      round_ids << round.id
    end
    @maxScore = Score.where(round_id: round_ids).maximum("score")
    @maxScoreName = Member.find(Score.where(score: @maxScore).last.member_id).name
  end

  def lowScoreIndividual
    round_ids = []
    Round.where(day_id: Day.where(date: Date.today).last.id).each do |round|
      round_ids << round.id
    end
    @minScore = Score.where(round_id: round_ids).minimum("score")
    @minScoreName = Member.find(Score.where(score: @minScore).last.member_id).name
  end

  def highScoreTeam

  end

end
