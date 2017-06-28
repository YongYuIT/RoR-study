class CreateStaffs < ActiveRecord::Migration[5.0]
  def change
    create_table :staffs do |t|
      t.string :name
      t.string :username
      t.string :password_md5
      t.string :position
      t.string :email

      t.timestamps
    end
  end
end
