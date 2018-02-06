class MembersController < ApplicationController
  def create

    @member = Member.new
    @member.team_id = :team.to_s.to_i
    @member.name = :name
    @member.save
    redirect_to @member
  end

  def show
    @member = Member.find(params[:id])
  end

  def index
    @members = Member.all
  end

  def destroy
    @member = Member.find(params[:id])
    @member.destroy
    redirect_to members_path
  end

  private
  def member_params
    params.require(:member).permit(:name, :team)
  end
end
