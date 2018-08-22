class CommentsController < ApplicationController

    def create
        #comment = Comment.new
        comment = Comment.new(comment_params)
        comment.save
        #preguntar! redirect_to question_path(params[:comment][:commentable_id])
        redirect_to questions_path
        
        # if @comment.save
        #   redirect_to polymorphic_path([@comment.commentable]), notice: 'Comment created'
        # else
        #   render :new
        # end
    end

  private
  
    def comment_params
      params.require(:comment).permit(:text, :commentable_type, :commentable_id)
    end
end
