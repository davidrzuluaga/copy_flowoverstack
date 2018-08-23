class AnswervotesController < ApplicationController
    def create
        answer = Answer.find(params[:answer_id])
        answer.vote_answers.create(user: current_user)
        
        redirect_to question_path(Answer.find(params[:answer_id]).question_id)
    end
      
    def destroy
        answer = Answer.find(params[:answer_id])
        answer.vote_answers.where(user: current_user).take.try(:destroy)
        
        redirect_to question_path(Answer.find(params[:answer_id]).question_id)
    end
end
