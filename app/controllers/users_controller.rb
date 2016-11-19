class UsersController < ApplicationController
  
  def signup
    @cred=Credential.new
    @user=User.new
  end
  
  def create
    @user = User.new(users_params)
    @cred=Credential.new(user: @user, username: @user.username , password: params[:password], userType: 'user')
    @userType="user";
    # if Credential.find_by(loginId: "")
    #   flash[:notice] = "Username already exist"
    #   render 'signup'
    # end
    if @user.valid? && @cred.valid?
      @cred=Credential.new(user: @user, username: @user.username , password: params[:password], userType: 'user')
      @user.save
      @cred.save
      flash[:notice] = "Account successfully created"
      redirect_to root_path(@details)
    else
      render 'signup'
    end
  end
  
  private
  def users_params
      params.require(:user).permit(:fname, :lname, :email, :username)
  end
  
  
end