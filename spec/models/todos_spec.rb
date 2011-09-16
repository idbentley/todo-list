require 'spec_helper'

describe Todo do
	context "A todo" do
		it "should be invalid without an account" do
			todo = Todo.new("content" => "asdf")
			todo.should be_invalid
		end
		it "should be invalid without any content" do
			todo = Todo.new("account_id" => 1)
			todo.should be_invalid
		end
		it "should be valid with both an acceptable account and content" do
			todo = Todo.new("account_id" => 1, "content" => "asdf")
			todo.should be_valid
		end
	end
end
