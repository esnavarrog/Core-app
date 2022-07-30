class BitsController < ApplicationController
   # before_action :require_user, only: [:index]
   before_action :set_girl, except: %i[bit_of_post]

   def index
      @amount = @girl.posts
      amount_pending = @amount.joins(:bits).select('sum(bits.price_pay) as amount')
                           .group(:id)
                           .map{|a| a.amount }.sum
      @amount_pending = amount_pending*850
   end

   def bit_of_post
      @post = Post.find(params[:id])
   end

   def set_girl
      @girl = Girl.friendly.find(params[:girl_id])
   end
end
