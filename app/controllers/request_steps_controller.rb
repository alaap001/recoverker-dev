class RequestStepsController < ApplicationController
include Wicked::Wizard
before_action :authenticate_user!

steps :personal , :college

def show
	@request = Request.find(session[:current_request])
	render_wizard
end

def update
@request =  Request.find(session[:current_request])
@request.attributes = request_params
render_wizard @request
end

private

  def request_params
  	params.require(:request).permit(:fullname,:email,:contact,:reason,:address_1,:address_2,:state,:city,:zipcode,:enrollment_no,:batch,:fircopy,:course,:extras,:college_id,:year_of_exam,:semester,:fathername, :hsemployer, :hsuniversity, :hsprogramme)
  end
  def finish_wizard_path
  request_path(@request)

end
end
