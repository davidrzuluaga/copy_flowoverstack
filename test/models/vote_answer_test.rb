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

require 'test_helper'

class VoteAnswerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
