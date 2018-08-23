# == Schema Information
#
# Table name: vote_answers
#
#  id         :integer          not null, primary key
#  answers_id :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class VoteAnswer < ApplicationRecord
  belongs_to :answer
  belongs_to :user
end
