class MembersController < ApplicationController



  def create

    @member = Member.new(member_params)
#    @member.team_id = :team_id
#    @member.name = :name
    @member.save(validate:false)
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
    params.require(:member).permit(:name, :team_id)
  end
end
