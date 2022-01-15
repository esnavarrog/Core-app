class InscriptionsController < ApplicationController

    def new
        @inscription = Inscription.new
    end

    def create
        @inscription = Inscription.new(inscription_params)
        @inscription.user = current_user
        @inscription.save
        render :create
        
    end


    private
    def inscription_params
        params.require(:inscription).permit(:rut, :name, :datetime, :date, :commentary, :number_operation, :amount, :hour)
    end
end
