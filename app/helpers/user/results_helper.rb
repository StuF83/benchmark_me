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
end
