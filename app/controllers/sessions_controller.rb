class SessionsController < ApplicationController
	def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password]) && user.locked?
      sign_in user
      redirect_back_or user
    elsif user.locked?
       flash.now[:error] = 'Account is locked' 
       render 'new'
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
