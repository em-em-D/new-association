class AttendaceController < ApplicationController
    before_action :logged_in_user

    def create
        @event = Event.find(params[:event_id])
        current_user.attend @event
        flash[:success] = 'You would be attending this event'
        redirect_back(fallback_location: @event)
    end

    def destroy
        @event = Event.find(params[:event_id])
        current_user.leave @event
        flash[:success] = 'you have successfully left this event'
        redirect_back(fallback_location: @event)
    end
end
