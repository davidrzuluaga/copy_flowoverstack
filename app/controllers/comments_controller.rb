class CommentsController < ApplicationController

    def create
      comment = Comment.new(comment_params)
      comment.user = current_user
      if comment.save
        redirect_to question_path(comment.commentable_type == "Question" ? comment.commentable.id : comment.commentable.question_id)
      else
        
    end

    def destroy
      @comment = Comment.find(params[:id])
      if @comment.user == current_user
        comment = Comment.find(params[:id])
        comment.destroy
        redirect_to question_path(comment.commentable_type == "Question" ? comment.commentable.id : comment.commentable.question_id)
      end
    end

  private
  
    def comment_params
      params.require(:comment).permit(:text, :commentable_type, :commentable_id)
    end
end

