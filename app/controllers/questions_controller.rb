class QuestionsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :destroy, :edit]
  def index
    @questions = Question.all
  end
 
  def new
    @question = Question.new
  end
  
  def create
    @question = Question.new(question_params)
    
      if @question.save
          redirect_to questions_path
      else
          render :new
      end
  end
  
  def show
    @question = Question.find(params[:id])
  end  
  
  def edit
    @question = Question.find(params[:id])
  end
  
  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      redirect_to questions_path, notice: "Success!"
  else
      render :edit
  end
  end
  
  def destroy
    
  end

  def question_params
    params.require(:question).permit(:title, :body)
  end
  
end
  