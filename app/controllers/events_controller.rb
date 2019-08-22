class EventsController < ApplicationController
    def index
        render :index

    end
    
    def create
        event = Event.new(event_params)
        if event.save
            redirect_to '/users/show'
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
