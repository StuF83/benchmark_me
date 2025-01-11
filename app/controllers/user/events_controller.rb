class User::EventsController < ApplicationController
  before_action :authenticate_user!

  def index
    @events = current_user.events
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = current_user.events.new
  end

  def create
    @event = current_user.events.new(event_params)
    if @event.save
      redirect_to user_event_path(@event), notice: "Event created successfully"
    else
      puts @event.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to user_event_path(@event), notice: "Event updated successfully"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def event_params
    params.expect(event: [ :name, :description, :units ])
  end
end
