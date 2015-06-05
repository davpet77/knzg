class RegistrationController < ApplicationController

	skip_before_filter :verify_authenticity_token

def usr_login
  	end

def usr_signup
end

 def register
 	@usr_name = params[:usr_name]
 	@password = params[:password]
 	@password_confirmation = params[:password_confirmation]
 	@usr_email = params[:usr_email]
	
 	if @password == @password_confirmation
 	
 	usr = Usr.create_with_password(@usr_name, @usr_email, @password)
 	
 	if usr

 		session[:current] = true
 		session[:usr_name] = usr.usr_name
 	
 		redirect_to '/profile'
 	else
 		redirect_to '/login'
 end
else
	redirect_to '/login'
end
  end
 # layout 'profile_layout'
  
  def profile
#binding.pry
  	unless session[:current] == true
  		redirect_to '/usr_login'
  	end
  end
def logout
	session[:current] = false
	session[:usr_name] = ''
	redirect_to '/profile'
  	end

#POST /login

def login

	@usr_name = params[:usr_name]
	@password = params[:password]
	
#binding.pry
	usr = Usr.where(usr_name: @usr_name).first

	if usr
	valid = usr.verify_password(@password)
	
	if valid
	session[:current] = true
	session[:usr_name] =params[:usr_name]
	redirect_to '/profile'
else
	redirect_to '/usr_login'
end
else
	redirect_to '/usr_login'

end
end
end
