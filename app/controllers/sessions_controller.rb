class SessionsController < ApplicationController
#This is where we create (aka login) and destroy (aka logout) sessions
  def new
  end

  def create
    user = User.authenticate_with_credentials(params[:email], params[:password])
    if user 
      # Save the user id inside the browser cookie. This is how we keep the user 
      # logged in when they navigate around our website.
      session[:user_id] = user.id
      redirect_to '/'
    else
    # If user's login doesn't work, send them back to the login form with an error message.
    flash.now[:alert] = "Invalid email or password"
    render :new # Assuming you have a 'new' view for the login form
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end



end
