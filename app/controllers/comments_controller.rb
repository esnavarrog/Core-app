class CommentsController < ApplicationController
    
    def create
        @comment = Comment.new
        @comment.commentable_id = params[:commentable_id]
        @comment.commentable_type = params[:commentable_type]
        @comment.message = params[:message]
        @comment.user = current_user.id if current_user.present?
        if params[:commentable_type] == 'Post'
            @post = Post.find(params[:commentable_id])
        else
            @post = Post.find(params[:post_id])
            @reply = Comment.find(params[:commentable_id])
        end
        if @comment.save
            render :new
        else
            puts @comment.errors.messages.first
            render :form_error
        end
    end

    def see_comments
        @post = Post.find(params[:id])
        @comments = @post.comments.order(created_at: :asc).last(6)
        @poly_likes
    end

    def all_comments
        @post = Post.find(params[:id])
        @comments = @post.comments.order(created_at: :asc)
    end

    private

    def comment_params
        params.require(:comment).permit(:user, :message, :commentable_id, :commentable_type)
    end
end
