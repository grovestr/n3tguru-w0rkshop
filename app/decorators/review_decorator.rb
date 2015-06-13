class ReviewDecorator < Draper::Decorator
  delegate_all

  def author
     # old, more complicated way:
     # "#{User.find(Review.find(id).user_id).firstname} #{User.find(Review.find(id).user_id).lastname}"
    "#{review.user.firstname} #{review.user.lastname}"
  end
end
