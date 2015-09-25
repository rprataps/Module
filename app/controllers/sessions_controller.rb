class SessionsController < ApplicationController

  def new
  end

  def admin_login 
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase, user_type: params[:session][:user_type])
    if user && user.authenticate(params[:session][:password])
      log_in user
#      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
 #     redirect_back_or user
       if(user.user_type == "user")
         redirect_to user
       else
         redirect_to user
         #redirect_to admin_url
       end
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
