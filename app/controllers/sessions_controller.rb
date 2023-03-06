class SessionsController < ApplicationController

   def new 
    @current_user
   end

   def create 

    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        flash[:success] = "Successfully logged in"
        redirect_to root_path
    else
        flash[:failure] = "Invalid Username and/or Password"
        render :new, status: :unprocessable_entity
    end
   end

   def destroy
    session.delete(:user_id)
    @current_user = nil
    redirect_to new_session_path
    end


end