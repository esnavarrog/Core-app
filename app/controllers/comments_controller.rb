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
            puts @comment.errors.messages.first
            render :form_error
        end
    end

    def see_comments
        @post = Post.find(params[:id])
        @comments = @post.comments.order(created_at: :asc)
        @poly_likes
    end

    private

    def comment_params
        params.require(:comment).permit(:user, :message, :commentable_id, :commentable_type)
    end
end
