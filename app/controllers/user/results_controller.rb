class User::ResultsController < ApplicationController
  before_action :set_event
  def new
    @result = @event.results.new
  end

  def create
    @event = Event.find(params[:event_id])

    if @event.units == "seconds"
      value = (params[:result]["hours"].to_i * 60 * 60) +
              (params[:result]["minutes"].to_i * 60) +
              (params[:result]["seconds"].to_i)
    end

    @result = @event.results.new(attempt_date: result_params["attempt_date"], score: value)
    if @result.save
      redirect_to user_result_path(@result), notice: "Result created successfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_event
    @event = current_user.events.find(params[:event_id])
  end

  def result_params
    params.require(:result).permit(:attempt_date, :hours, :minutes, :seconds)
  end
end
