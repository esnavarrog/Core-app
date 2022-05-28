class BitsController < ActionController::Base
   def index
      @amount = Girl.first.posts.map{|post| post.bits.map{|price| price.price_pay}}.flatten.sum
   end
end