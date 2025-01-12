module User::ResultsHelper
  def result_input_fields(event)
    case event.units
    when "seconds"
      content_tag(:div, class: "time-inputs") do
        number_field_tag("result[hours]", nil, placeholder: "Hours", class: "form-control") +
        number_field_tag("result[minutes]", nil, placeholder: "Minutes", class: "form-control") +
        number_field_tag("result[seconds]", nil, placeholder: "Seconds", class: "form-control")
      end
    when "kilograms"
      number_field_tag("result[value]", nil, min: 1, max: 999, placeholder: "Enter weight in kg", class: "form-control")
    when "meters"
      number_field_tag("result[kilometers]", "0", min: 1, max: 999, class: "form-control") +
      number_field_tag("result[meters]", ".0", step: 0.1, min: 0.0, max: 0.9, class: "form-control") +
      content_tag(:p, "km")
    when "integer"
      number_field_tag("result[value]", 1, min: 1, max: 999, placeholder: "Enter repetitions", class: "form-control")
    else
      text_field_tag("result[value]", nil, placeholder: "Enter value", class: "form-control")
    end
  end

  def normalise_time(seconds)
    hours, remaining_seconds = seconds.divmod(3600)
    minutes, seconds = remaining_seconds.divmod(60)
    { hours: hours,
      minutes: minutes,
      seconds: seconds }
  end

  def format_time(seconds)
    time = normalise_time(seconds)
    "%02d:%02d:%02d" % [ time[:hours], time[:minutes], time[:seconds] ]
  end

  def format_weight(kilograms)
    "#{kilograms}kg"
  end

  def normalise_distance(meters)
    km, meters = meters.divmod(1000)
    { kilometers: km,
      meters: meters }
  end

  def format_distance(meters)
    kilometers = meters / 1000.0
    "%.1fkm" % kilometers
  end

  def format_result(event, score)
    case event.units
    when "seconds"
      format_time(score)
    when "kilograms"
      format_weight(score)
    when "meters"
      format_distance(score)
    else
      score.to_s
    end
  end
end
