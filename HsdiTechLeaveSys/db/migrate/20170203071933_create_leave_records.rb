class CreateLeaveRecords < ActiveRecord::Migration[5.0]
  def change
    create_table :leave_records do |t|
      t.string :staff_id
      t.datetime :from_date
      t.datetime :to_date
      t.datetime :apply_date
      t.string :reason
      t.string :leave_type
      t.string :state

      t.timestamps
    end
  end
end
