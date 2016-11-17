class CredentialsController < ApplicationController
  
  def signup
    @details=Credential.new
  end
  def create
    @details = Credential.new(credentials_params)
    # if Credential.find_by(loginId: "")
    #   flash[:notice] = "Username already exist"
    #   render 'signup'
    # end
    if @details.save
      flash[:notice] = "Article was successfully created"
      redirect_to root_path(@details)
    else
      render 'signup'
    end
  end
  private
  def credentials_params
      params.require(:credential).permit(:loginId, :password)
  end
end