json.extract! course, :id, :short_name, :name, :description, :created_at, :updated_at
json.url course_url(course, format: :json)
