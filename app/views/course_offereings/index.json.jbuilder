json.array!(@course_offereings) do |course_offereing|
  json.extract! course_offereing, :id, :faculty_id, :course_id, :semester, :year, :start_time, :end_time
  json.url course_offereing_url(course_offereing, format: :json)
end