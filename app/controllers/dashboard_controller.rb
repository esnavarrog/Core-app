class DashboardController < ApplicationController
  def index
    @girls = Girl.order("RANDOM()")
  end
  
  def show
    
  end

end
