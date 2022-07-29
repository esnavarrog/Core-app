class BitsController < ApplicationController
   # before_action :require_user, only: [:index]
   before_action :set_girl, except: %i[bit_of_post]

   def index
      @amount = @girl.posts
   end

   def bit_of_post
      @post = Post.find(params[:id])
   end

   def set_girl
      @girl = Girl.friendly.find(params[:girl_id])
   end
end
