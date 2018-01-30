class HomeController < ApplicationController
	
def index
	if user_signed_in?
	  	@feedback = current_user.feedbacks.new
	  end 
end

def partners
	@payment_id = params[:payment_id]
	@request_id = params[:payment_request_id]
end

def thankyou

end

end
