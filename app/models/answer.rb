class Answer < ApplicationRecord
  has_many :comments, as: :commentable, dependent: :destroy
  belongs_to :question
end
