class UsersController < ApplicationController

  def new
   @user = User.new
  end

  def create

    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/'
    else
      render :new
    end
  end  


  #define the delete_user action to handle the user deletion
  #added this to cleanup db pass sign up test
  def delete_user
    user = User.find_by_email(params[:email])
    if user
      user.destroy
      head :no_content
    else
      head :not_found
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end
