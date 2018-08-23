class QuestionsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :destroy, :edit]
  
  def index
    
    @users = User.all

    @questions = Question.order("created_at DESC")
    if params[:question].present?
      @questions = Question.where("title LIKE ? OR body LIKE ?", "%#{params[:question]}%", "%#{params[:question]}%")
      # @questions = @questions.where("body LIKE ?", "%#{params[:question]}%") 
    end
  end
 
  def new
    @question = Question.new
  end
  
  def create
    @question = Question.new(question_params)
    @question.user = current_user
      if @question.save
          redirect_to questions_path
      else
          render :new
      end
  end
  
  def show
    @question = Question.find(params[:id])
    @questioncomments = Question.find(params[:id]).comments
    @answers = Question.find(params[:id]).answers
  end  
  
  def edit
    @question = Question.find(params[:id])
    unless @question.user == current_user
      redirect_to questions_path
    end
  end
  
  def update
    @question = Question.find(params[:id])
    if @question.user == current_user
      if @question.update(question_params)
        redirect_to questions_path, notice: "Success!"
      else
        render :edit
      end
    end
  end
  
  def destroy
    @question = Question.find(params[:id])
    if @question.user == current_user
      question = Question.find(params[:id])
      question.destroy
      redirect_to questions_path
    end
  end

private

  def question_params
    params.require(:question).permit(:title, :body)
  end
  
end
  