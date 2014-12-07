json.array!(@courses) do |course|
  json.extract! course, :id, :course_number, :course_name, :course_description, :credit_hours
  json.url course_url(course, format: :json)
end