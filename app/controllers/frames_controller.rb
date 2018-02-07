class FramesController < ApplicationController
  def new
    @frame = Frame.new
  end

  def create
    @frame = Frame.new(frame_params)
    @frame.turn_id = Turn.last.id
    @frame.member_id = Member.last.id
    score = frame_params[:ball1].to_i + frame_params[:ball2].to_i + frame_params[:ball3].to_i
    @frame.score = score
    turn = Turn.find(@frame.turn_id).number.to_i

    if turn != 1
      if Frame.where(member_id: @frame.member_id, turn_id: @frame.turn_id).exists
        previous_turn_id = Turn.where(round_id: Turn.find(@frame.turn_id).round_id, number: (turn-1)).last.id
        @temp = Frame.where(member_id: @frame.member_id, turn_id: previous_turn_id).last
        @frame.score = score + @temp.score.to_i
      end
    end


    if @frame.member_id = Member.where(team_id: Team.last.id).last.id
      @turn = Turn.new
      @turn.round_id = Round.last.id
      @turn.number = Turn.last.number.to_i + 1
      if !@turn.save(validate: false)
          print 'Turn didnt save /n'
          @frames = Frame.all
          render 'root_path'
      end
    end

    if @frame.save(validate: false)
          print 'Frame saved /n'
          @frames = Frame.all
          render 'root_path'
    else
      print 'Frame didnt save /n'
      @frames = Frame.all
      render 'root_path'
    end

  end

  def show
    @frame = Frame.find(:id)
  end

  def next
  end

  def index
    @frames = Frame.all.order("created_at ASC")

  end

  def inRound
    @frames = Frame.in_round(round_id).order("created_at ASC")
  end

  private

  def frame_params
		params.require(:frame).permit(:turn_id, :member_id,:ball1, :ball2, :ball3, :score, :isfinal)
	end
  def find_frame
    @frame = Frame.find(params[:id])
  end

end
