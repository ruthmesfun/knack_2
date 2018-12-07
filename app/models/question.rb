class Question < ApplicationRecord
  belongs_to :author, class_name: "User"
  belongs_to :category
  has_many :comments
  has_many :commenters, through: :comments

  validates_presence_of :title, :description, :category_id

  def created_human_time
    self.created_at.getlocal.strftime("%B %d, %Y at %I:%M%p")
  end

  def self.search(query)
    matches = Question.all.select {|q| q.title.downcase.include?(query) || q.description.downcase.include?(query)}
    if !matches.nil?
      matches
    end
  end
end
