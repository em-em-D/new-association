# frozen_string_literal: true

# :nodoc:
class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      user @user
      flash[:success] = 'You are signed up'
      redirect_to '/login'
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @attended_events = current_user.attended_events
    @events = current_user.events
  end

  private

  def user_params
    params.require(:user).permit(:username, :email)
  end
end
