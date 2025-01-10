class User::ResultsController < ApplicationController
  before_action :set_event
  def new
    @result = @event.results.new
  end

  def create
    @result = @event.results.new(result_params)
    if @result.save
      redirect_to result_path(@result), notice: "Result created successfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_event
    @event = current_user.events.find(params[:event_id])
  end

  def result_params
    params.require(:result).permit(:date, :score)
  end
end
