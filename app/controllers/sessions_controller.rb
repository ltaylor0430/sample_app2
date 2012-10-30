class SessionsController < ApplicationController
 
 def new
 end
 
 def create
	user = User.find_by_email(params[:email])
 	if user && user.authenticate(params[:password])
 		#Sign the user in and redirect to the user's show page.
 	#	if  params[:remember_me]
	#		cookies.permanent[:remember_token] = user.remember_token	
#		else
#			cookies[:remember_token] = user.remember_token				
#		end
		
 		sign_in user, persist: params[:remember_me]
 		redirect_back_or user
	else
	 	flash.now[:error] = 'Invalid email/password combination'  
	 	render 'new'
 	end
 
 end

 def destroy
 	sign_out
 	redirect_to root_path
 end
end
