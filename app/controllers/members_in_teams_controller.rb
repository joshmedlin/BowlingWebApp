class MembersInTeamsController < ApplicationController
  def Create
    @MembersInTeam = MembersInTeam.new(m_in_t_params)

    @MembersInTeam.save
  end

  def show
    @MembersInTeam = MembersInTeam.find(params[:id])
  end

  def index
    @MembersInTeam = MembersInTeam.all
  end

  private
  def m_in_t_params
    params.require(:members_in_team).permit(:member_id, :team_id)
  end

end
