class QuestionsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :destroy, :edit]

  def index
    if params[:question].present?
      @questions = Question.where("title LIKE ? OR body LIKE ?", "%#{params[:question]}%", "%#{params[:question]}%")
    else
      @questions = Question.order("created_at DESC")
    end
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.user = current_user
    if @question.save
      flash[:success] = "Created successfully!"
      redirect_to questions_path
    else
      render :new
    end
  end

  def show
    @question = Question.find(params[:id])
    @questioncomments = @question.comments
    @answers = @question.answers
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
      # binding.pry
      if @question.update(question_params)
        flash[:success] = "Updated successfully!"
        redirect_to question_path
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
      flash[:success] = "Deleted successfully!"
      redirect_to questions_path
    end
  end

  private

  def question_params
    params.require(:question).permit(:title, :body)
  end
end
