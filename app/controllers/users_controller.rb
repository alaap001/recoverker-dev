class UsersController < ApplicationController
before_action :authenticate_user!
def show
	@user = User.find(params[:id])
	if @user == current_user
		@requests = current_user.requests
	else
		redirect_to root_path
	end
end

def generate_new_password_email
	user = User.find(params[:user_id]) 
	user.send_reset_password_instructions
	flash[:notice] = "Reset password instructions have been sent to #{user.email}." 
	redirect_to admin_user_path(user)
end

private

end
