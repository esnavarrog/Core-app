class PostsController < ApplicationController
  before_action :set_girl, except: [:index, :pay_post, :look, :destroy]

  def index
    options = params
    @posts = Post.limit(1000).fetch(options).order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def look
    @look = true
    @post = Post.find(params[:id])

  end
  
  def create
    if post_params[:content].present? || post_params[:img].present? || post_params[:video].present?
      @post = Post.new(post_params)
      @post.girl = @girl
      @post.user = current_user

      @posts = @girl.posts.order(created_at: :desc)

      @post.save
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

  def pay_post
    @post = Post.find(params[:id])
    if current_user.bit >= @post.price
      @bit = Bit.new
      @bit.price_pay = @post.price
      @bit.post = @post
      @bit.user = current_user
      if @bit.save
        current_user.discount(@post.price)
        respond_to do |format|
          format.js
        end
      end
    else
      render :pay_error
    end
  end

  def set_girl
    @girl = Girl.friendly.find(params[:girl_id])
  end

  private

  def post_params
    params.require(:post).permit(:content_body, :img, :girl_id, :video, :price)
  end
end
