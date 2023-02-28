class UsersController < ApplicationController

    def index
        @users = User.all
    end

    def show
        @user = User.find(params[:id])
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
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update(params.require(:user).permit(:username, :role, :profile_image))
            flash.notice = "#{@user}'s profile successfully updated"
            redirect_to @user
        else
            render :edit, status: :unprocessable_entity
        end
    
    end

    private
    def user_params
        params.require(:user).permit(:username, :password)
    end
end