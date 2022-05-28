class PostsController < ApplicationController
  before_action :set_girl, except: [:index, :pay_post]

  def index
    options = params
    @posts = Post.fetch(options).order(created_at: :desc)
  end

  def new
    @post = Post.new
  end
  
  def create
    if post_params[:content].present? || post_params[:img].present? || post_params[:video].present?
      @post = Post.new(post_params)
      @post.girl = @girl
      @post.user = current_user

      @posts = @girl.posts.order(created_at: :desc)

      @post.save
      redirect_to @girl
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
      else
        render :pay_error
      end
    end
  end

  def set_girl
    @girl = Girl.friendly.find(params[:girl_id])
  end

  private

  def post_params
    params.require(:post).permit(:content, :img, :girl_id, :video)
  end
end
