class CommentsController < ApplicationController

    def create
      comment = Comment.new(comment_params)
      comment.save
      redirect_to question_path(comment.commentable)
    end

  private
  
    def comment_params
      params.require(:comment).permit(:text, :commentable_type, :commentable_id)
    end
end
