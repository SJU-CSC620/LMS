class SessionsController < ApplicationController
def new
  redirect_to user_path(session[:user_id]) if logged_in?
end
def create
  cred = Credential.find_by(username: params[:session][:username].downcase)
  if cred && cred.authenticate(params[:session][:password])
    session[:user_id] = cred.user.id
    flash[:success] = "You have successfully logged in"
    redirect_to user_path(cred.user)
  else
    flash.now[:danger] = "There was something wrong with your login information"
    render 'new'
  end
end

def destroy
  session[:user_id] = nil
  flash[:success] = "You have logged out"
  redirect_to root_path
end
end