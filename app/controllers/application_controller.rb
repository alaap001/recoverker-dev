class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
   before_action :configure_permitted_parameters, if: :devise_controller?

require 'Instamojo-rb'

api = Instamojo::API.new("c51766be718d7d5e5a5aeff00b83e202","0e268600acb0b7ea8b8414007f5f9fee","https://test.instamojo.com/api/1.1/")
client = api.client

rescue_from ActiveRecord::RecordNotFound do
  flash[:warning] = 'Resource not found.'
  redirect_back_or root_path
end

def redirect_back_or(path)
  redirect_to request.referer || path
end

protected

  def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up) do |user_params|
    	user_params.permit(:firstname,:lastname,:gender,:campus,:email,:userpic,:password,:password_confirmation)
    end

	 devise_parameter_sanitizer.permit(:account_update) do |user_params|
 	user_params.permit(:firstname,:lastname,:gender,:campus,:email,:password,:userpic,:password_confirmation,:current_password)
 end	

end
end
