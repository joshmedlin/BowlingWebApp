class TeamsController < ApplicationController
  def create
    @team = Team.new(team_params)
    @team.save

    params[:member_id].each do |id|
      @members_in_team = MembersInTeam.new
      @members_in_team.team_id = @team.id
      @members_in_team.member_id = id
      @members_in_team.save
    end
    redirect_to @team
  end

  def show
    @team = Team.find(params[:id])
  end

  def index
    if TeamsInDay.where(day_id: Day.where(date: Date.today)).empty?
      @teams = []
    else
      @teams_in_day = TeamsInDay.where(day_id: Day.where(date: Date.today).last.id)
      teams = []
      @teams_in_day.each do |team|
        teams << team.id
      end

      @teams = Team.where(id: teams)
    end
  end

  def destroy
    @team = Team.find(params[:id])
    MembersInTeam.where(team_id: @team.id).each do |members_in_team|
        members_in_team.destroy
    end
    @team.destroy
    redirect_to teams_path
  end

  private
  def team_params
    params.require(:team).permit(:name)
  end

end
