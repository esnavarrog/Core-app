class DashboardController < ApplicationController
  def index
    @girls = Girl.order("RANDOM()")
    @new_girls = Girl.all.last(4)
    @destacadas = Girl.where(status:0).order("RANDOM()")
  end
  
  def show
    
  end

end
