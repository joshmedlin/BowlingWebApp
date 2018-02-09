class ScoresController < ApplicationController

  def new
      @round = Round.new
  end
  def create

  end
  def index
  end

  private
  def score_params
      params.require(:score).permit(:round_id, :member_id, :score)
    end
end
