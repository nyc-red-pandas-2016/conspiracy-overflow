class Question < ActiveRecord::Base
  has_many :question_tags
  has_many :tags, through: :question_tags
  has_many :answers
  has_many :comments, as: :commentable
  has_many :votes, as: :votable
  belongs_to :user

  validates :title, :body, presence: :true

  before_save :downcase_title


  def best_answer
    self.answers.find(self.best_answer_id)
  end

  def self.search(search)
    if search
      where(["title LIKE ?","%#{search}%"])
    else
      all
    end
  end

  def downcase_title
    self.title.downcase
  end
end
