class SessionsController < ApplicationController
	def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user
      if user.locked?
       flash.now[:error] = 'Account is locked' 
       render 'new'
      elsif user.authenticate(params[:password]) # && user.locked?
        sign_in user
        redirect_back_or user
      end
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
