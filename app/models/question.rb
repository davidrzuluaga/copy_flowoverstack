class Question < ApplicationRecord
    validates :title, :question, presence: true
end
