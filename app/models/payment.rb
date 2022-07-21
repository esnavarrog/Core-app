class Payment < ApplicationRecord

	belongs_to :user
	validates :bits, presence: {message: "Debes seleccionar un plan para realizar la compra"}

	enum bits: [:light, :medium, :large, :xlarge]

	BITS = {light:10, medium:30, large:60, xlarge:120}
	def self.prepare_webpay(payment_params, current_user)
		payment = self.new
		case payment_params[:bits]
		when 'light'
			payment.amount = 10000
		when 'medium'
			payment.amount = 30000
		when 'large'
			payment.amount = 60000
		when 'xlarge'
			payment.amount = 110000
		end
		payment.bit_amount = BITS[payment_params[:bits].to_sym]
		payment.user_id = current_user.id if current_user.present?
		payment.bits = payment_params[:bits].to_sym
		payment.description = "Compra de #{payment.bit_amount} por #{payment.amount}"
		payment.save
		payment.update(session_id:"session-#{payment.id}", buy_order: "ordenDeCompra-#{payment.id}")
		payment
	end

	def webpay_object_data
		{
			buy_order: self.buy_order,
			session_id: self.session_id,
			amount: self.amount
		}
	end

end
