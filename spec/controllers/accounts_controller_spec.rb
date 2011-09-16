require 'spec_helper'

describe AccountsController do

  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end
  end
	describe "POST 'create'" do
		it "should create an account with valid input" do
			post 'create', :account => { :email => "asdf@asdf.com", :password => "password", :password_confirmation => "password" }
			assigns[:account].email.should == "asdf@asdf.com"
		end
	end
end
