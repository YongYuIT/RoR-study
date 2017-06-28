json.extract! staff, :id, :name, :username, :password_md5, :position, :email, :created_at, :updated_at
json.url staff_url(staff, format: :json)