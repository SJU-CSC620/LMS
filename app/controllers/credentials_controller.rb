class CredentialsController < ApplicationController
  attr_accessor  :password, :newpassword, :repeatnewpassword
  before_action :set_user, except:[:edit, :update]
  def edit
    @user =User.find(params[:id])
    @cred=Credential.find_by(user_id: params[:id])
  end
  def update
    @user =User.find(params[:id])
    @cred = Credential.find_by(user_id: params[:id])
    if @cred && @cred.authenticate(params[:user][:password])
      if params[:user][:newpassword]==params[:user][:repeatnewpassword] 
        if @cred && @cred.authenticate(params[:user][:newpassword])
          flash[:danger] = "Current password cannot be used to update\nPlease use a different Password"
          redirect_to edit_credential_path(@user)
        else
          @cred.password=params[:user][:newpassword]
          if @cred.save
            flash[:success] = "Password successfully updated"
            if @cred.userType=='user'
              redirect_to user_path(@usercred.user)
            else
              redirect_to admin_path(@usercred.user)
            end
          else
            errormsg=""
            @cred.errors.full_messages.each do |msg|
              errormsg=errormsg+"\n"+msg
              end
              flash[:danger] = errormsg
            redirect_to edit_credential_path(@user)
          end
        end
      else
        flash[:danger] = "new password didnot match\n Please enter same Password"
        redirect_to edit_credential_path(@user)
      end
    else
    flash[:danger] = 'Wrong current password'
    redirect_to edit_credential_path(@user)
    end
    
  end
def set_user
    @user = User.find(params[:id])
end

end