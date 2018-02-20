class MembersController < ApplicationController

    def create

      @member = Member.new(member_params)
      @member.inactive = false
      @member.save
      redirect_to members_path
    end

    def index
      @members = Member.order("name ASC").where(inactive: [false, nil])
    end

    def deactivate
      @member = Member.find(params[:id])
      @member.inactive = true
      @member.save
      redirect_to members_path
    end

    private
    def member_params
      params.require(:member).permit(:name)
    end
  end
