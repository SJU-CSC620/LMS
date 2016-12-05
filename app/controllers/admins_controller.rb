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
  
  def search
  
  end
  def results
    # update the below to display search results
    @keyWord=params['keyWord'];
    if(@keyWord=='')
    flash[:success] = "Enter a keyword to search"
    redirect_to search_user_path(@user)
    end
    @searchtype=params['searchtype'];
    if(@searchtype=="title")
        @books=Book.where('title LIKE ?',"%#{@keyWord}%")
      elsif(@searchtype=="author")
        @books=Book.where('author LIKE ?',"%#{@keyWord}%")
      else
        @books=Book.where('category LIKE ?', "%#{@keyWord}%")
    end
  end
  def viewBooks
    # update the below to display current borrowed books
    @borrowedlog=Booklog.where("user_id = ? AND returned IS ?", @user.id, nil)
    # @booksBorrowed=Booklog.find_by(user_id: @user.id)
  end
  def editbook
    @book=Book.find(params[:id])
  end
  def deletebook
    
  end
  def searchuser
    
  end
  def userresults
    @keyWord=params['keyWord'];
    if(@keyWord=='')
    flash[:success] = "Enter a keyword to search"
    redirect_to searchuser_admin_path(@user)
    end
    @searchtype=params['searchtype'];
    if(@searchtype=="fname")
        @users=User.where('fname LIKE ?',"%#{@keyWord}%")
      elsif(@searchtype=="lname")
        @users=User.where('lname LIKE ?',"%#{@keyWord}%")
      else
        @users=User.where('username LIKE ?', "%#{@keyWord}%")
    end
  end
  def resetpassword
    @cred=Credential.find_by(user_id: params[:id])
    @cred.password=@cred.username
    if @cred.save
      flash[:success] = "Password Reset successfull"
        redirect_to admin_path
    end
  end
  def recreateuser
    @user = User.find(params[:id])
    @cred=Credential.new(user: @user, username: @user.username , password: @user.username, userType: 'user')
    if @cred.save
      flash[:success] = "Account successfully recreated"
        redirect_to admin_path
    end
  end
  def createuser
    @cred=Credential.new
    @user=User.new
  end
  def saveuser
    @user = User.new(users_params)
    @cred=Credential.new(user: @user, username: @user.username , password: @user.username , userType: params[:user][:userType])
    @userType="user";
    # if Credential.find_by(loginId: "")
    #   flash[:notice] = "Username already exist"
    #   render 'signup'
    # end
    if @user.valid? && @cred.valid?
      @user.save
      @cred.save
      flash[:success] = "Account successfully created"
      redirect_to admin_path
    else
      render 'createuser'
    end
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