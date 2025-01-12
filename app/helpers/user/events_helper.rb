module User::EventsHelper
  def measurement_description(event)
    case event.units
    when "seconds"
      "Time"
    when "kilograms"
      "Weight"
    when "meters"
      "Distance"
    when "integer"
      "Repetitions"
    end
  end
end
