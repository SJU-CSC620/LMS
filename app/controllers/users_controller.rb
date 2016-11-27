class UsersController < ApplicationController
  #check for session before direction to pages
  #before_action :set_cred, only:[:editpassword]
  before_action :set_user, except:[:signup, :create]
  before_action :require_user , only: [:edit,:userhome,:editpassword, :updatepassword, :viewBooks]
  before_action :require_same_user , only: [:edit,:editpassword, :viewBooks]
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
      flash[:success] = "Your profile has been successfully updated  "
      if Credential.find_by(user_id: @user.id).userType=='user'
        redirect_to user_path(@user)
      else
        redirect_to admin_path(@user)
      end
    else
      render 'edit'
    end
  end
  
  def search
    
  end
  
  def viewBooks
    # update the below to display current borrowed books
    @booksBorrowed=Booklog.find_by(user_id: @user.id)
  end
  
  def results
    # update the below to display search results
    @keyWord=params['keyWord'];
    @searchtype=params['searchtype'];
    if(@searchtype=="title")
        @books=Book.where('title LIKE ?',"%#{@keyWord}%")
      elsif(@searchtype=="author")
        @books=Book.where('author LIKE ?',"%#{@keyWord}%")
      else
        @books=Book.where('category LIKE ?', "%#{@keyWord}%")
    end
  end
  def userhome
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
      flash[:danger] = "You can only edit your profile"
      redirect_to root_path
    end
  end
  
end