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
    @teams = Team.all
  end

  def destroy
    @team = Team.find(params[:id])
    @team.destroy
    redirect_to teams_path
  end

  private
  def team_params
    params.require(:team).permit(:name)
  end

end
