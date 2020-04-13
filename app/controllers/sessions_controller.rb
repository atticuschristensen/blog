class SessionsController < ApplicationController

  def create
    user = User.find_by(username: params[:username].downcase)
    if user && user.authenticate(params[:password])
      #sign_in(user)
      session[:user_id] = user.id
      flash[:success]= "Signed in as " + user.username
      redirect_to root_url
    else
      flash[:danger] = "Login failed. Please check username and password are entered correct"
       redirect_to signin_url
     end
     
     #sign_in(user)    
  end

  
end
