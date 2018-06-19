require 'test_helper'

class LeaveRecordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @leave_record = leave_records(:one)
  end

  test "should get index" do
    get leave_records_url
    assert_response :success
  end

  test "should get new" do
    get new_leave_record_url
    assert_response :success
  end

  test "should create leave_record" do
    assert_difference('LeaveRecord.count') do
      post leave_records_url, params: { leave_record: { apply_date: @leave_record.apply_date, from_date: @leave_record.from_date, leave_type: @leave_record.leave_type, reason: @leave_record.reason, staff_id: @leave_record.staff_id, state: @leave_record.state, to_date: @leave_record.to_date } }
    end

    assert_redirected_to leave_record_url(LeaveRecord.last)
  end

  test "should show leave_record" do
    get leave_record_url(@leave_record)
    assert_response :success
  end

  test "should get edit" do
    get edit_leave_record_url(@leave_record)
    assert_response :success
  end

  test "should update leave_record" do
    patch leave_record_url(@leave_record), params: { leave_record: { apply_date: @leave_record.apply_date, from_date: @leave_record.from_date, leave_type: @leave_record.leave_type, reason: @leave_record.reason, staff_id: @leave_record.staff_id, state: @leave_record.state, to_date: @leave_record.to_date } }
    assert_redirected_to leave_record_url(@leave_record)
  end

  test "should destroy leave_record" do
    assert_difference('LeaveRecord.count', -1) do
      delete leave_record_url(@leave_record)
    end

    assert_redirected_to leave_records_url
  end
end
