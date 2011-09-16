class TodosController < ApplicationController

	def new
		@todo = Todo.new(:account_id => current_account.id)
	end

	def create
		@todo = Todo.new(params[:todo].merge(:account_id => current_account.id))
		if @todo.save
			redirect_to account_url(current_account)	
		else
			render "new"
		end
	end

	def edit
		@todo = Todo.find_by_account_id_and_id(current_account, params[:id])
	end

	def update
		@todo = Todo.find_by_account_id_and_id(current_account, params[:id])
		@todo.update_attributes(params[:todo])
		if @todo.save
			flash[:notice] = "Todo updated"
			redirect_to account_url(current_account)
		else
			render "edit"
		end
	end
end
