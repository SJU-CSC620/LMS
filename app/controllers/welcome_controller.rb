class WelcomeController < ApplicationController
  def home
    
  end
  def signup
    @details=Credential.new
  end
  def create
    @details = Credential.new(credentials_params)
    if @details.save
      flash[:notice] = "Article was successfully created"
      redirect_to root_path
    else
      render 'signup'
    end
  end
  def credentials_params
      params.require(:credentials).permit(:loginId, :password)
  end
  
  def displaycredentials
    @details=Credential.all
  end
end