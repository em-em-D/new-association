class EventsController < ApplicationController
    before_action :current_user, only: :destroy

    def index
       @events = Event.all
       
    end
    def new
        @event = Event.new
    end
    
    def create
        @event = current_user.events.build(event_params)
        if @event.save
            redirect_to  events_path
        else
             flash[:event_creation_errors] = event.errors.full_messages
            redirect_to '/dashboard'
        end
    
    end

    def show
    end

    private

    def event_params
        params.require(:event).permit(:eventype, :location, :date)
    end



end
