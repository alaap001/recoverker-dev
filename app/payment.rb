client = $api.client
payment_request = client.payment_request({amount:1020, purpose:@request.reason,phone:@request.contact,buyer_name:@request.fullname,expires_at:Time.now+3.day, email:@request.email,send_email:true,send_sms:true, redirect_url:'localhost:3000/thankyou'})
#payment_request = client.payment_request({amount:100, purpose: 'api', send_email: true, email: 'ankurgel+2@gmail.com', redirect_url: 'http://ankurgoel.com'})
payment_details = client.payment_request_status(payment_request.id)
@request.payment_id = payment_details.id
@request.payment_status = payment_details.status
@request.payment_url = payment_details.longurl
url =  payment_request.longurl					
redirect_to url