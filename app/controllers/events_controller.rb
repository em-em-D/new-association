# frozen_string_literal: true

# :nodoc:
class EventsController < ApplicationController
  require 'attendaces_controller.rb'
  # before_action :logged_in_user, only: %i[new create destroy]
  before_action :right_user, only: %i[destroy]

  def index
    @events = Event.all
    @past_events = @events.past_events
    @upcoming_events = @events.upcoming_events
  end

  def new
    @event = current_user.events.build
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      flash[:success] = 'Event succeffully created'
      redirect_to eventlist_path
    else
      flash.now[:error] = 'Unable to create event'
      redirect_to events_path
    end
  end

  def show
    @event = Event.find(params[:id])
    @attendees = @event.attendees
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    flash[:success] = 'Event has been deleted'
    redirect_to '/dashboard'
  end

  private

  def event_params
    params.require(:event).permit(:eventype, :location, :date, :description)
  end

  def right_user
    @event = current_user.events.find_by(id: params[:id])
    redirect_to root_url if @event.nil?
  end
end
