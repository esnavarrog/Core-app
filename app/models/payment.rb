class Payment < ApplicationRecord

	belongs_to :user

	enum bits: [:light, :medium, :large]
	def self.prepare_webpay(payment_params, current_user, webpay_payment)
		payment = self.new
		payment.amount = payment_params[:webpay_amount]
		payment.user = current_user if current_user.present?
		payment.bits = payment_params[:bits].to_i
		payment.save
		payment.session_id = "session-#{payment.id}"
		payment.buy_order = "ordenDeCompra-#{payment.id}"
		payment.save
		payment
	end

	def webpay_object_data
		# @tx = Transbank::Webpay::WebpayPlus::Transaction.new(::Transbank::Common::IntegrationCommerceCodes::WEBPAY_PLUS)
		# @resp = @tx.create(
		#   buy_order: buy_order,
		#   session_id: session_id,
		#   amount: amount,
		# )
		puts self.inspect
		{
			buy_order: buy_order,
			session_id: session_id,
			amount: amount
		}
	end
end
