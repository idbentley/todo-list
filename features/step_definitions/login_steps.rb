Given /^there is an existing account with email = "([^"]*)" and password = "([^"]*)"$/ do  |email, password|
	account = Account.new({"email" => email, "password" => password})
	account.save
end
