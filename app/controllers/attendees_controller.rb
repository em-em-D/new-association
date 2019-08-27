class AttendeesController < ApplicationController
  before_action :logged_in_user

  def create
    @event = Event.find(params[:event_id])
    current_user.attend @event
    flash[:success] = 'Successfully attended event'
    redirect_to events_path
  end

  def destroy
    @event = Event.find(params[:event_id])
    current_user.leave @event
    flash[:success] = 'gracefully leaved event'
    redirect_to events_path
  end

end
