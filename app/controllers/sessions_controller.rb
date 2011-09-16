class SessionsController < ApplicationController
	

  def new
		if current_account
			redirect_to account_url(current_account)
		end
  end

	def create
		account = Account.authenticate(params[:email], params[:password])
		if account
			session[:account_id] = account.id
			redirect_to account_url(account), :notice => "Login successful"
		else
			flash.now.alert = "Invalid login credentials"
			render "new"
		end
	end

	def destroy
		session[:account_id] = nil
		redirect_to root_url, :notice => "Logged out"
	end

end
