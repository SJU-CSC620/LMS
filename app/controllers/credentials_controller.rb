class CredentialsController < ApplicationController
  attr_accessor  :password, :newpassword, :repeatnewpassword
  def edit
    @user =User.find(params[:id])
    @cred=Credential.find_by(user_id: params[:id])
  end
  def update
    @user =User.find(params[:id])
    cred = Credential.find_by(user_id: params[:id])
    if cred && cred.authenticate(params[:user][:password])
      if params[:user][:newpassword]==params[:user][:repeatnewpassword] 
        if cred && cred.authenticate(params[:user][:newpassword])
          flash.now[:danger] = 'Current password cannot be used to update'
          flash.now[:danger] = 'Please use a different Password'
          render 'edit'
        else
          @usercred = Credential.find_by(user_id: params[:id])
          @usercred.password=params[:user][:newpassword]
          if @usercred.save
            flash[:success] = "Password successfully updated"
            if cred.userType=='user'
              redirect_to user_path(@usercred.user)
            else
              redirect_to admin_path(@usercred.user)
            end
          else
            flash.now[:danger] = @usercred.errors.full_messages
            render 'edit'
          end
        end
      else
        flash.now[:danger] = 'new password didnot match'
        flash.now[:danger] = 'Please enter same Password'
        render 'edit'
      end
    else
    flash.now[:danger] = 'Wrong current password'
    render 'edit'
    end
    
  end


end