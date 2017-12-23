class RequestsController < ApplicationController
	before_action :authenticate_user!
  before_action :find_request , only: [:show,:edit,:update,:destroy]
	def show
	if session[:current_request] != nil
		session.delete(:current_request)
	end
    @college = College.find_by(id: @request.college_id)
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
		session[:current_request] = @request.id
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

  private 

  def find_request
  @request = Request.find(params[:id])
  if @request.user != current_user || @request.user == nil
    redirect_to root_path
    flash[:error]="Invalid URL"
  end
  end
  def request_params
  	params.require(:request).permit(:fullname,:email,:contact,:reason,:address_1,:address_2,:state,:city,:fircopy,:zipcode,:fathername,:enrollment_no,:batch,:course,:extras,:college_id,:hsuniversity,:hsprogramme,:hsemployer)
  end
end
