module MembersHelper
  def avg(id)
  @avg = 0
  scores = 0
  sum = 0
  Score.where(member_id: id).each do |score|
    scores = scores + 1
    unless score.score.nil?
      sum = sum + score.score
    end
  end
  p id
  if scores > 0
    @avg = sum / scores
  end
end
end
