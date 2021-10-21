class PostsController < ApplicationController
  before_action :set_girl

  def new
    @post = Post.new
  end
  def create
    if post_params[:content].present? || post_params[:img].present? || post_params[:video].present?
      @post = Post.create(post_params)
      @post.girl = @girl
      @post.user = current_user
      @posts = @girl.posts.order(created_at: :desc)
      respond_to do |format|
        if @post.save
          format.js
        end
      end
    else
      render :form_error
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
  end

  def update
  end

  def set_girl
    @girl = Girl.find(params[:girl_id])
  end

  private

  def post_params
    params.require(:post).permit(:content, :img, :girl_id, :video)
  end
end
