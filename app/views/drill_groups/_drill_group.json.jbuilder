json.extract! drill_group, :id, :name, :description, :level, :max_points, :user_id, :badge_name, :created_at, :updated_at
json.url drill_group_url(drill_group, format: :json)
