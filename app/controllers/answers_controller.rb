class AnswersController < ApplicationController

    def create
       @answer = Answer.new(question_params)
       @answer.user = current_user
       @answer.save
       redirect_to question_path(@answer.question)
    end  

    def destroy
        @answer = Answer.find(params[:id])
        if @answer.user == current_user
          answer = Answer.find(params[:id])
          answer.destroy
          redirect_to question_path(@answer.question)  
        end
    end

private

    def question_params
        params.require(:answer).permit(:text, :question_id)
      end
end
