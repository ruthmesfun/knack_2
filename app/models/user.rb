class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

    has_many :questions, class_name: "Question", foreign_key: "author_id"
    has_many :comments, class_name: "Comment", foreign_key: "commenter_id"
    # validates_presence_of :name, :username, :experience_level 
    # validates :username, uniqueness: true

    EXPERIENCE_LEVELS = ['Student', 'Junior', 'Mid-Level', 'Expert' ]
    def num_questions_asked
        questions.count
    end

    def num_comments
        comments.count
    end

    def expert_categories 
        comments.map{|comment| comment.commented_category}.uniq
    end

    def helpfullness
        if comments.empty?
            0
        else
            ar = comments.map{|comment| comment.approachability_rating}.inject(:+)
            v = comments.map{|comment| comment.votes}.inject(:+)
            ar + v
        end
    end

    def self.from_omniauth(auth)
        where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
            user.provider = auth.provider
            user.uid = auth.uid
            user.name = auth.info.name
            user.username = auth.info.nickname
            user.image = auth.info.image
            user.email = auth.info.email
            user.password = Devise.friendly_token[0,20]
        end
    end

    def signed_up_today
        self.updated_at.to_date == Date.current
    end

    def todays_comments
        questions.select do |question| 
            if  question.comments.any?
                question.comments.last.updated_at.to_date == Date.current
            end
        end

    end

    def answered_questions
      a_question_ids = self.comments.map {|comments| comments.question_id}.uniq
      a_question_ids.map do |q_id|
        Question.find(q_id)
      end
    end

    def torch_achievements
        (num_comments + num_questions_asked) >3
    end

    def crown_achievements
        helpfullness > 3
    end

end
