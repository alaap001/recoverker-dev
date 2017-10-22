class CollegesController < ApplicationController
  def index
  	@college = College.college_search(params[:college_search])
  end
end
