class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            sign_in @user
            user @user
            flash[:success] = "You are signed up"
            redirect_to '/login'
        else
           render :new
        end
    end

    def show
        @user = User.find(user_params[:id])
    end

    private

    def user_params
        params.require(:user).permit(:username, :email)
    end
end
