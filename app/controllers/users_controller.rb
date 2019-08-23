class UsersController < ApplicationController
  def index
    render :index
  end


  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id]= user.id
      redirect_to '/dashboard'
    else
      flash[:register_errors] = user.errors.full_messages
      redirect_to '/'
    end
  end

  def show
    event = Event.all
  end

  

  private

  def user_params
    params.require(:user).permit(:username,:email,:password, :password_confirmation)
  end

end