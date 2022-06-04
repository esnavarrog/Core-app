class WebpayController < ApplicationController
   skip_before_action :verify_authenticity_token
   #Normal transaction      
  def webpay_return_url
    result = WebpayPlus.transaction_confirmation(params[:token_ws])

    puts 'resultado obtenido: ' + result['buy_order'].to_s
    puts 'token de transbank: ' +  params[:token_ws]
    payment = Payment.find_by(buy_order:result['buy_order'])
    payment.update(tbk_token: params[:token_ws])
    payment.update(state: 'pending') 

    if(result && result['response_code'] == 0 && (payment = Payment.find_by(buy_order:result['buy_order'])))
      state = result['error_desc'].to_s
      accountingdate        = result['accounting_date'].to_s
      buyorder                  = result['buy_order'].to_s
      sharesnumber                  = result['sharesnumber'].to_s
      cardnumber                = result['card_number'].to_s
      amount                        = result['amount'].to_s
      commercecode          = result['commercecode'].to_s
      authorizationcode = result['authorization_code'].to_s
      paymenttypecode   = result['payment_type_code'].to_s
      responsecode          = result['response_code'].to_s
      transactiondate   = result['transaction_date'].to_s
      urlredirection        = result['url'].to_s
      vci                           = result['vci'].to_s

      if responsecode == '0' 
        webpay_data = [state, accountingdate, cardnumber, amount, authorizationcode, paymenttypecode, responsecode, transactiondate, urlredirection, vci, sharesnumber].to_s
        payment.update(state: 'complete')
        payment.update(webpay_data: webpay_data)
        payment.update(pay_date: Time.now)
        payment.update(verified: true)  
        # response = Net::HTTP.post_form(URI(urlredirection.to_s), token_ws: params[:token_ws])
        @payment = payment
        user = current_user
        bits = current_user.bit
        case @payment.bits
        when 'light'
          user.bit = bits + 10
        when 'medium'
          user.bit = bits + 30
        when 'large'
          user.bit = bits + 60
        end
        user.save
        render "payments/webpay_success"
      else
        payment.update(webpay_data: result['error_desc'])
        payment.update(description: "Pago con WebPay de: "+ current_user.nickname + " con errores")
        redirect_to webpay_error_path                       
      end
      return                    
    else
      payment.update(description: "Pago con WebPay de: "+ current_user.nickname + " con errores")
      payment.destroy
      redirect_to webpay_nullify_path
    end             
  end   

  def webpay_final_url
    if(params[:TBK_ID_SESION] == nil)
      @payment =Payment.where(tbk_token: params[:token_ws]).take
      redirect_to webpay_success_path(token_ws: params[:token_ws])
    else
      redirect_to webpay_nullify_path
    end
  end
end