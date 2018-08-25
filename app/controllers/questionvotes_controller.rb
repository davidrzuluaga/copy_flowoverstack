class QuestionvotesController < ApplicationController
    def create
        question = Question.find(params[:question_id])
        if question.vote_questions.where(user: current_user).count == 0
            question.vote_questions.create(user: current_user)
            redirect_to question_path(params[:question_id])
        end
    end
      
    def destroy
        question = Question.find(params[:question_id])
        if question.vote_questions.where(user: current_user).count == 1
            question.vote_questions.where(user: current_user).take.try(:destroy)
            redirect_to question_path(params[:question_id])
        end

    end
end
