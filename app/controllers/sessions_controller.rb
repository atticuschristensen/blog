class SessionsController < ApplicationController

  def create
    user = User.find_by(username: params[:username].downcase)
    if user && user.authenticate(params[:password])
      #sign_in(user)
      session[:user_id] = user.id
      redirect_to root_url
     else
       redirect_to signup_url
     end
     
     #sign_in(user)    
  end

  
end
