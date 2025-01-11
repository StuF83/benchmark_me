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
      text_field_tag("result[value]", nil, placeholder: "Enter weight in kg", class: "form-control")
    when "meters"
      text_field_tag("result[value]", nil, placeholder: "Enter distance in meters", class: "form-control")
    when "integer"
      text_field_tag("result[value]", nil, placeholder: "Enter repetitions", class: "form-control")
    else
      text_field_tag("result[value]", nil, placeholder: "Enter value", class: "form-control")
    end
  end
end
