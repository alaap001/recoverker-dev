class RequestsController < ApplicationController
	before_action :authenticate_user!
  before_action :find_request , only: [:show,:edit,:update,:destroy,:payment]
	
  def show
    @college = College.find_by(id: @request.college_id)
    @institute = Institute.find_by(id: @request.institute_id) 

#hide environmetal variables


  end

  def new
    @request = current_user.requests.build
  end

  def create
  	@request = current_user.requests.build(request_params) 
    @status = @request.create_status()
    
  	#this is invalid and only for dev. purpose
  	# need to associate every request with colg 
  	#rather than forcing int he college  inside form
      if @request.save
     
           redirect_to @request
        else
    		render 'new'
    	end
  end

  def edit
  end
  
  def update
    if @request.update(request_params)
       redirect_to @request
    else
      render 'edit'
    end

  end
  
  def destroy
    @request.destroy
    redirect_to root_path
  end

def payment

 client = $api.client
 reason = @request.reason
 phone = @request.contact
 fullname = @request.fullname
 email = @request.email
 amount = @request
 #time = Time.now+3.days


    #@payment_request = client.payment_request({amount:1020, purpose:reason,phone:phone,buyer_name:fullname, email:email,send_email:true,send_sms:true, redirect_url:'localhost:3000/thankyou'})
    @payment_request = client.payment_request({amount:10, purpose: reason, send_email: true,phone:phone,buyer_name:fullname, email:email, redirect_url: 'http://recoverker.com/thankyou'})
    payment_details = client.payment_request_status(@payment_request.id)
    payment_id = payment_details.id
    payment_status = payment_details.status
    payment_url = payment_details.longurl
    @request.update(payment_id: payment_id,payment_status: payment_status, payment_url:payment_url)
    url =  payment_details.longurl 
    if @request.save
      redirect_to url       
    end  
end

  private 

  def find_request
  @request = Request.find(params[:id])
  if @request.user != current_user || @request.user == nil
    redirect_to root_path
    flash[:error]="Invalid URL"
  end
  end
  def request_params
  	params.require(:request).permit(:fullname,:email,:contact,:reason,:institute_id,:payment_id,:payment_url,:payment_status,:address_1,:address_2,:state,:city,:fircopy,:zipcode,:fathername,:enrollment_no,:batch,:course,:extras,:college_id,:hsuniversity,:hsprogramme,:hsemployer)
  end

end
