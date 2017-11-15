class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  before_action :require_login

private

	/def logged_in?
	  @current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

	def current_user
		@current_user
	end

	helper_method :logged_in?/

	def authorize
		if @current_user.nil?
			redirect_to login_url 
		end
	end

 
    def require_login
      unless logged_in?
        flash[:error] = "You must be logged in to access this section"
        redirect_to login_url # halts request cycle
      end
    end

end
