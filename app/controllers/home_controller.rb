class HomeController < ApplicationController
def index
	if session[:current_request] != nil
		session.delete(:current_request)
	end
	if user_signed_in?
	  	@feedback = current_user.feedbacks.new
	  end
	@randomusers = User.all.limit(5) 
end

def partners

end
end
