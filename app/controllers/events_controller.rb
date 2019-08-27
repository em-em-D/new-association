class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @events = Event.new
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      flash[:success] = 'Event succeffully created'
      redirect_to '/dashboard'
    end
  end


  def show
    @event = Event.find(params[:id])
    #code to show users attending and event @users = @event.attendees
  end

  #def attend
  #end

  #def leave
  #end

  private

  def event_params
    params.require(:event).permit(:eventype, :location, :date, :description)
  end
end
