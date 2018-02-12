class RoundsController < ApplicationController
  def show
  end
  def new
      @round = Round.new
  end
  def create
    p params
  end

  def update
    p params
    round_id = Round.last.id
      params[:member_id].each do |value|
        @score = Score.new
        @score.member_id = MembersInTeam.find(value).member_id
        @score.round_id = round_id
        @score.score = params[value]
        @score.save
        p @score
        end
  end

  def index
  end

  private

  def score_params
  params.require(:score).permit(:round_id, :member_id, :score)
  end
end
