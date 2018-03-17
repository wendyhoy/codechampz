json.extract! student_drill, :id, :user_id, :drill_id, :is_correct, :created_at, :updated_at
json.url student_drill_url(student_drill, format: :json)
