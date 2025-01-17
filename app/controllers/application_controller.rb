class ApplicationController < ActionController::Base
  protect_from_forgery

	helper_method :current_account

	private
	
	def current_account
		@current_account ||= Account.find(session[:account_id]) if session[:account_id]
	end

end
