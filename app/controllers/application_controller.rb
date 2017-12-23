class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
   before_action :configure_permitted_parameters, if: :devise_controller?

require 'Instamojo-rb'

$api = Instamojo::API.new("137cf2cf726a9a36123b4d8eac47722b","9f6c0be0367f01ec7fecdce1c142df31")


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
