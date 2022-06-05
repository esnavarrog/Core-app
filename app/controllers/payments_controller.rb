class PaymentsController < ApplicationController
	require 'openssl'
	require 'base64'

	def new
		@payment = Payment.new
	end
	
	def create    
		if !payment_params[:webpay_amount].nil? && (webpay_payment = payment_params[:webpay_amount].to_i) > 0  
				@payment = Payment.prepare_webpay(payment_params, current_user, webpay_payment) 
				result = WebpayPlus.init_transaction(@payment)
				
				puts '++++++++++++++++'
				puts result.inspect
				puts '++++++++++++++++'
			if(result['token'].present? && result['url'].present?)
				token = result['token']
				url   = result['url']
				@payment.update(tbk_token:token) if @payment
				response = Net::HTTP.post_form(URI(url.to_s), token_ws: token.to_s)
				render html: response.body.html_safe
				return        
			else
				redirect_to webpay_error_path 
				return
			end
		else
			redirect_to :back, notice: 'Ha ocurrido un error procesando el pago.'
		end   
	end

	# Función que presenta un resumen del pago
	def webpay_success
      @payment = Payment.where(tbk_token: params[:token_ws]).lock(true).take
	end
	#Función que despliega una vista, indicando un error en la transacción
	def webpay_error
	end
	# Función que despliega información en el caso que el usuario haya cancelado la transacción
	def webpay_nullify
		@payment = Payment.where(tbk_token: params[:token_ws]).lock(true).take
	end

	private

	def payment_params
		params.require(:payment).permit(:webpay_amount, :bits)
	end
end