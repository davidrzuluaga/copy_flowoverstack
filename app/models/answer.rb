# == Schema Information
#
# Table name: answers
#
#  id          :integer          not null, primary key
#  question_id :integer
#  text        :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#

class Answer < ApplicationRecord
  has_many :comments, as: :commentable, dependent: :destroy
  belongs_to :question
  belongs_to :user
  has_many :vote_answers, dependent: :destroy

  validates :text, presence: true


  def voted_by?(user)
    vote_answers.exists?(user: user)
  end

end
