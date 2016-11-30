class BooksController < ApplicationController
  #check for session before direction to pages
  #before_action :set_cred, only:[:editpassword]
  before_action :set_user, except: [:new, :create, :edit, :update]
  before_action :require_user , except: [:new, :create, :edit, :update]

  def index
    @user=User.find(params[:id])
    @books = Book.all
  end
  
  def show
    @user=User.find(params[:id])
  end
  
  def new
    @book= Book.new
  end
  
  def create
    @book=Book.new()
    @book = Book.new(books_params)
    if @book.valid?
      @book.save
      flash[:success] = "Book successfully created"
      redirect_to root_path
    else
      render 'new'
    end
  end
  def edit
    @book=Book.find(params[:id])
  end
  def update
    @book =Book.find(params[:id])
      if @book.update(books_params)
        flash[:success] = "Book successfully updated"
        redirect_to root_path
      else
        render 'edit'
      end
  end
  private
    def books_params
        params.require(:book).permit(:title, :author, :category, :status)
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