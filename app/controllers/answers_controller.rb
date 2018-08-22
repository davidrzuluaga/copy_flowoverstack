class AnswersController < ApplicationController

    def create
       @answer = Answer.new(question_params)
       @answer.save
       redirect_to question_path(params[:answer][:question_id])
    end 

private

    def question_params
        params.require(:answer).permit(:text, :question_id)
      end
end
