class PaymentsController < ApplicationController
	skip_before_action :verify_authenticity_token, only:[:success_final]
	require 'openssl'
	require 'base64'
	require 'json'

	def new
		@payment = Payment.new
	end
	
	def create    
		if !payment_params[:bits].nil?
			@payment = Payment.prepare_webpay(payment_params, current_user) 
			result = Flow.init_transaction(@payment)
			if(result['token'].present? && result['url'].present?)
				token = result['token']
				url   = result['url']
				@payment.update(tbk_token:token) if @payment
				# response = Net::HTTP.post_form(URI(url.to_s), token_ws: token.to_s)
				redirect_to url + "?token=" +token       
			else
				redirect_to webpay_error_path 
				return
			end
		else
			redirect_to :back, notice: 'Ha ocurrido un error procesando el pago.'
		end   
	end

	# Función que presenta un resumen del pago
	def pay_success
		response = Flow.success_flow(params)
	end
	#Función que despliega una vista, indicando un error en la transacción
	def webpay_error
		webpay_success
	end
	# Función que despliega información en el caso que el usuario haya cancelado la transacción
	def webpay_nullify
		webpay_success
	end

	def webpay_return_url

	end

	def success_final
		response = Flow.success_flow(params)
		if response.code == 200
			@payment = Payment.where(tbk_token:params['token']).lock(true).take
			@payment = @payment.success_pay(response)
			unless @payment.media.nil?
				@user = @payment.user
				last_bit = @user.bit
				new_bit = @payment.bit_amount
				@user.bit = new_bit + last_bit
				@user.save(validate:false)
				@response = response

				redirect_to pago_realizado_path(pay_id:@payment.id)

			else
				redirect_to pago_rechazado_path(pay_id:@payment.id)
			end

		end
	end

	def show
		@payment = Payment.find(params[:pay_id])
	end

	def pay_aproved
		@payment = Payment.find(params[:pay_id])
	end

	private

	def payment_params
		params.require(:payment).permit(:webpay_amount, :bits)
	end
end