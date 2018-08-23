# == Schema Information
#
# Table name: vote_questions
#
#  id          :integer          not null, primary key
#  question_id :integer
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class VoteQuestion < ApplicationRecord
  belongs_to :question
  belongs_to :user
end
