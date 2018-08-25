class AnswersController < ApplicationController

    def create
       @answer = Answer.new(question_params)
       @answer.user = current_user
       if @answer.save
        flash[:success] = "Answer posted successfully!"
        redirect_to question_path(@answer.question)
       else
        flash[:danger] = "The answer can't be blank!"
        redirect_to question_path(@answer.question)
       end
    end  

    def destroy
        @answer = Answer.find(params[:id])
        if @answer.user == current_user
          answer = Answer.find(params[:id])
          answer.destroy
          flash[:success] = "Answer deleted!"
          redirect_to question_path(@answer.question)  
        end
    end

private

    def question_params
        params.require(:answer).permit(:text, :question_id)
      end
end
