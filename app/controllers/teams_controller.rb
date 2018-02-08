class TeamsController < ApplicationController
  def create
    @team = Team.new(team_params)

    @team.save
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
