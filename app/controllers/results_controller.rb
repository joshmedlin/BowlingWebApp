class ResultsController < ApplicationController
  def index
    highScoreIndividual
    lowScoreIndividual
    highScoreTeam

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
    @maxTeamAverage = 0
    @maxTeam = ""
    numberOfRounds = 0
    @team_ids = []
    TeamsInDay.where(day_id: Day.where(date: Date.today).last.id).each do |t|
      @team_ids << t.team_id
    end
    Team.find(@team_ids).each do |team|
      @team = team
      numberOfMembers = 0
      totalSumOfScores = 0
      numberOfRounds = 0
      Round.where(day_id: Day.where(date: Date.today).last.id).each do |round|
      MembersInTeam.where(team_id: @team.id).each do |m|
        if !Score.where(round_id: round.id, member_id: m.member_id).empty?
          numberOfMembers = numberOfMembers + 1
          totalSumOfScores = totalSumOfScores + Score.where(round_id: round.id, member_id: m.member_id).last.score.to_i
        end
      end
      numberOfRounds = numberOfRounds = + 1
      end
      averageScore = totalSumOfScores / (numberOfMembers * numberOfRounds)
      if averageScore > @maxTeamAverage
        @maxTeamAverage = averageScore
        @maxTeam = team.name
      end
  end
end

end
