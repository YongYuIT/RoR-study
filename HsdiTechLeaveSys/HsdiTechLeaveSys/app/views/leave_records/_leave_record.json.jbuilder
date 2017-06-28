json.extract! leave_record, :id, :staff_id, :from_date, :to_date, :apply_date, :reason, :leave_type, :state, :created_at, :updated_at
json.url leave_record_url(leave_record, format: :json)