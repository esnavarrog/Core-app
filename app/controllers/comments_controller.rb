class CommentsController < ApplicationController
    
    def create
        @comment = Comment.new
        @comment.commentable_id = params[:commentable_id]
        @comment.commentable_type = params[:commentable_type]
        @comment.message = params[:message]
        @comment.user = current_user.id if current_user.present?
        @post = Post.find(params[:commentable_id])
        if @comment.save
            render :new
        else
            render :form_error
        end
    end

    private

    def comment_params
        params.require(:comment).permit(:user, :message, :commentable_id, :commentable_type)
    end
end
