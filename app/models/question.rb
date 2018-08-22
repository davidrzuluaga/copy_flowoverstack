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
    has_many :comments, as: :commentable
    belongs_to :user
    has_many :answer
    validates :title, :body, presence: true
end
