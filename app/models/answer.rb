class Answer < ApplicationRecord
  has_many :comments, as: :commentable
  belongs_to :question
end
