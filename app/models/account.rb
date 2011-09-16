class Account < ActiveRecord::Base
	
	attr_accessible :email, :password, :password_confirmation

	attr_accessor :password
	before_save :encrypt_password

	validates_confirmation_of :password
	validates_presence_of :password
	validates_presence_of :email
	validates_uniqueness_of :email

	has_many :todos, :dependent => :destroy

	def self.authenticate(email, password)
		account = find_by_email(email)
		if account && account.password_hash == BCrypt::Engine.hash_secret(password, account.password_salt)
			account
		else
			nil
		end
	end

	def encrypt_password
		if password.present?
			self.password_salt = BCrypt::Engine.generate_salt
			self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
		end
	end

end
