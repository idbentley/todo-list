class Todo < ActiveRecord::Base
	attr_accessible :content, :done, :account_id

	belongs_to :account

	validates_presence_of :content
	validates_presence_of :account_id

end
