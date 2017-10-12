class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
   before_action :configure_permitted_parameters, if: :devise_controller?

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
