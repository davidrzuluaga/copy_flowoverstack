# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class Question < ApplicationRecord
    has_many :comments, as: :commentable, dependent: :destroy
    belongs_to :user
    has_many :vote_questions, dependent: :destroy
    has_many :answers, dependent: :destroy
    
    validates :title, :body, presence: true
    
    def voted_by?(user)
        vote_questions.exists?(user: user)
    end

end
