class DayResultsController < ApplicationController
  def index
    round_ids = []
    Round.all.each do |round|
      if !Score.where(round_id: round.id).empty?
        round_ids << round.id
      end
    end
    @day_ids = []
    Round.find(round_ids).each do |round|
      @day_ids << round.day_id
    end
    @days = Day.find(@day_ids)


  end

  def dayIndex
    @day = Day.find(params[:format])
    highScoreIndividual
    lowScoreIndividual
    highScoreTeam

  end

  private

  def highScoreIndividual
    date = @day.date
    round_ids = []
    Round.where(day_id: Day.where(date: date).last.id).each do |round|
      round_ids << round.id
    end
    @maxScore = Score.where(round_id: round_ids).maximum("score")
    @maxScoreName = Member.find(Score.where(score: @maxScore).last.member_id).name
  end

  def lowScoreIndividual
    date = @day.date
    round_ids = []
    Round.where(day_id: Day.where(date: date).last.id).each do |round|
      round_ids << round.id
    end
    @minScore = Score.where(round_id: round_ids).minimum("score")
    @minScoreName = Member.find(Score.where(score: @minScore).last.member_id).name
  end

  def highScoreTeam
    date = @day.date
    @maxTeamAverage = 0
    @maxTeam = ""
    numberOfRounds = 0
    @team_ids = []
    TeamsInDay.where(day_id: Day.where(date: date).last.id).each do |t|
      @team_ids << t.team_id
    end
    Team.find(@team_ids).each do |team|
      @team = team
      numberOfMembers = 0
      totalSumOfScores = 0
      numberOfRounds = 0
      Round.where(day_id: Day.where(date: Date.today).last.id).each do |round|
      if !Score.where(round_id: round.id).empty?
      MembersInTeam.where(team_id: @team.id).each do |m|
        if !Score.where(round_id: round.id, member_id: m.member_id).empty?
          numberOfMembers = numberOfMembers + 1
          totalSumOfScores = totalSumOfScores + Score.where(round_id: round.id, member_id: m.member_id).last.score.to_i
        end
      end
      numberOfRounds = numberOfRounds = + 1
      end
      end
      if (numberOfMembers * numberOfRounds) > 0
        averageScore = totalSumOfScores / (numberOfMembers * numberOfRounds)
      else
        p numberOfMembers
        p numberOfRounds
        averageScore = 0
      end
      if averageScore > @maxTeamAverage
        @maxTeamAverage = averageScore
        @maxTeam = team.name
      end
  end
end

end
