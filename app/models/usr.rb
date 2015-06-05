class Usr < ActiveRecord::Base

	

	validates_presence_of :usr_name, :usr_email, :salt, :password_hash
	validates_uniqueness_of :usr_email
	validates_uniqueness_of :usr_name

def self.create_with_password(usr_name, usr_email, password)
	salt = SecureRandom.hex
	password_hash = self.generate_hash(password, salt)

	self.create(
		usr_name: usr_name,
		usr_email: usr_email,
		salt: salt,
		password_hash: password_hash
		)
end

def verify_password(password)
		valid =self.password_hash == Usr.generate_hash(password, self.salt)
		return valid
		
	end

	def self.generate_hash(password, salt)

		digest = OpenSSL::Digest::SHA256.new
		digest.update(password)
		digest.update(salt)
		password_hash = digest.to_s


	end
end