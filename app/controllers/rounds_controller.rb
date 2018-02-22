class RoundsController < ApplicationController
  def show
    @day = Day.find(params[:format])
  end
  def inRound
  end
  def new
      @round = Round.new
  end
  def create
    p params
  end

  def update
    p params
    @round = Round.new
    @round.day_id = Day.where(date: Date.today).last.id
    @round.save
    round_id = Round.last.id
    worked = true
      params[:member_id].each do |value|
        @score = Score.new
        @score.member_id = MembersInTeam.find(value).member_id
        @score.round_id = round_id
        @score.score = params[value]
        p @score
        if @score.save

        else
          worked = false
        end
      end
    if worked
      render 'rounds/index'
    else
      render 'rounds/index'
    end


  end

  def index
  end

  private

  def round_params
  params.require(:score).permit(:round_id, :member_id, :score)
  end
end
