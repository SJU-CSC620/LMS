class AdminsController < ApplicationController
  #check for session before direction to pages
  #before_action :set_cred, only:[:editpassword]
  before_action :set_user
  before_action :require_user , only: [:edit,:adminhome,:editpassword, :updatepassword]
  before_action :require_same_user , only: [:edit,:editpassword]
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
      redirect_to root_path(@user)
    else
      render 'signup'
    end
  end
  
  def edit
    @cred=Credential.find_by(username: @user.username)
  end
  
  def update
    @user.update(users_params)
    if @user.save
      flash[:success] = "Admin profile has been successfully updated  "
      redirect_to admin_path(@user.id)
    else
      render 'edit'
    end
  end
  
  def adminhome
    #The user home after login Page
  end
  
  private
    def users_params
        params.require(:user).permit(:fname, :lname, :email, :username)
    end
  
  def set_user
    @user = User.find(params[:id])
  end
  
  def set_cred
    @cred= Credential.find_by(username: @user.username)
  end
  
  def require_same_user
    if current_user != @user
      flash[:danger] = "You can only edit or delete your own articles"
      redirect_to root_path
    end
  end
  
end