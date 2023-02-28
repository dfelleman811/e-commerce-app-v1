class UsersController < ApplicationController

    before_action :set_user, only: [:show, :edit, :update, :destroy]

    def index
        @users = User.all
    end

    def show
        
    end

    def new 
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            flash.notice = "New User #{@user.username} created"
            redirect_to @user
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
       
    end

    def update

        if @user.update(params.require(:user).permit(:username, :role, :profile_image))
            flash.notice = "#{@user}'s profile successfully updated"
            redirect_to @user
        else
            render :edit, status: :unprocessable_entity
        end
    
    end

    def destroy 
        if @user.delete
            flash.notice = "User successfully deleted"
            redirect_to users_path 
        else
            flash.alert = "User not deleted"
            redirect_to users_path
        end
    end


    private

    def set_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:username, :password)
    end
end