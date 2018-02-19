module MembersHelper
  def avg(id)
  @avg = 0
  scores = 0
  sum = 0
  Score.where(member_id: id).each do |score|
    scores = scores + 1
    sum = sum + score.score
  end
  @avg = sum / scores
  end
end
