# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  commentable_type :string
#  commentable_id   :integer
#  text             :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  user_id          :integer
#

class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  belongs_to :user
  
  validates :text, presence: true
end
