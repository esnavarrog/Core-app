class Payment < ApplicationRecord

	belongs_to :user
	validates :bits, presence: {message: "Debes seleccionar un plan para realizar la compra"}

	enum bits: [:light, :medium, :large, :xlarge]


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
		payment.user_id = current_user.id if current_user.present?
		payment.bits = payment_params[:bits].to_sym
		payment.save
		payment.update(session_id:"session-#{payment.id}", buy_order: "ordenDeCompra-#{payment.id}")
		payment
	end

	def webpay_object_data
		puts '+--------++++'
		puts self.inspect
		puts '+--------++++'
		{
			buy_order: self.buy_order,
			session_id: self.session_id,
			amount: self.amount
		}
	end
end
