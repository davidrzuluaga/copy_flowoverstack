class AnswervotesController < ApplicationController
    def create
        answer = Answer.find(params[:answer_id])
        if answer.vote_answers.where(user: current_user).count == 0
            answer.vote_answers.create(user: current_user)
            redirect_to question_path(Answer.find(params[:answer_id]).question_id)
        end
    end
      
    def destroy
        answer = Answer.find(params[:answer_id])
        if answer.vote_answers.where(user: current_user).count == 1
            answer.vote_answers.where(user: current_user).take.try(:destroy)
            redirect_to question_path(Answer.find(params[:answer_id]).question_id)
        end
    end

end
