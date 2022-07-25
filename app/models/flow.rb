class Flow
    require 'json'
    require 'httparty'
    URL_BASE = ENV["webpay_ambient"] == "Production" ? 'https://www.flow.cl/api' : 'https://sandbox.flow.cl/api'

    def self.init_transaction(order)
        
        url = URL_BASE + '/payment/create'
        params = params_payment(order)
        params['s'] = signature_encripted(params)
        body = params.to_query

        headers = {
			'Content-Type' => 'application/x-www-form-urlencoded'
		}

        response = HTTParty.post(url, body:body, headers:headers)

		if (response = process_response(response))
			return response
		else
			return nil
		end
	end

    def self.params_payment(order)
        urlReturn = url_helpers.success_final_url(app_host)
        urlConfirmation = url_helpers.pay_success_url(app_host)
        
        params = {
            amount: order.amount, 
            apiKey: ENV['api_key_flow'], 
            currency: "CLP",
            urlReturn: urlReturn,
            urlConfirmation:urlConfirmation,
            email: order.user.email,
            commerceOrder: order.buy_order,
            subject: order.description,
        }
        params
    end

    def self.signature_encripted(params)
        secret_key = ENV['secret_key_flow']
        string_to_sign = Hash[params.sort].map{|i| i * "" } * ""
        signature_encripted = OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha256'), secret_key, string_to_sign)
        signature_encripted
    end

    def request_headers
		return {
			'api_Key' => ENV['api_key_flow'],
			'Content-Type' => 'application/x-www-form-urlencoded'
		}
	end

    def self.app_host
		Rails.application.config.action_mailer.default_url_options
	end

	def self.url_helpers
		Rails.application.routes.url_helpers
	end

    def self.process_response(response)
		if response.code == 200
			return JSON.parse(response.body)
		else
			return nil
		end
	end

    def self.success_flow(params)
        new_params = {}
        new_params['token'] = params['token']
        new_params['apiKey'] = ENV['api_key_flow']
        new_params['s'] = signature_encripted(new_params)
        url = URL_BASE + '/payment/getStatus'
        url = url + "?" + new_params.to_query

        response = HTTParty.get(url)
        response
    end
end