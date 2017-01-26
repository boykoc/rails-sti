require 'test_helper'

class AcceptedTimesheetsControllerTest < ActionController::TestCase
  setup do
    @accepted_timesheet = accepted_timesheets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:accepted_timesheets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create accepted_timesheet" do
    assert_difference('AcceptedTimesheet.count') do
      post :create, accepted_timesheet: {  }
    end

    assert_redirected_to accepted_timesheet_path(assigns(:accepted_timesheet))
  end

  test "should show accepted_timesheet" do
    get :show, id: @accepted_timesheet
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @accepted_timesheet
    assert_response :success
  end

  test "should update accepted_timesheet" do
    patch :update, id: @accepted_timesheet, accepted_timesheet: {  }
    assert_redirected_to accepted_timesheet_path(assigns(:accepted_timesheet))
  end

  test "should destroy accepted_timesheet" do
    assert_difference('AcceptedTimesheet.count', -1) do
      delete :destroy, id: @accepted_timesheet
    end

    assert_redirected_to accepted_timesheets_path
  end
end
