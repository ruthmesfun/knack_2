class Comment < ApplicationRecord
  belongs_to :commenter, class_name: "User"
  belongs_to :question

  validates_presence_of :statement
  validate :helpful?

  def created_human_time
    self.created_at.getlocal.strftime("%B %d, %Y at %I:%M%p")
  end

  def change_votes(vote)
    self.votes += vote.to_i
    self.save
  end

  def change_approachability_rating(approachable)
    self.approachability_rating += approachable.to_i
    self.save
  end

  def commented_category
    self.question.category.title
  end

  def helpful?
    if self.question.helpful_filter && self.commenter.helpfullness < 0
      errors.add(:statement, "cannot be added, your helpfulness rating is too low.")
    end
  end
end
