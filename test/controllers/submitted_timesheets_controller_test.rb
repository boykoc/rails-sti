require 'test_helper'

class SubmittedTimesheetsControllerTest < ActionController::TestCase
  setup do
    @submitted_timesheet = submitted_timesheets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:submitted_timesheets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create submitted_timesheet" do
    assert_difference('SubmittedTimesheet.count') do
      post :create, submitted_timesheet: {  }
    end

    assert_redirected_to submitted_timesheet_path(assigns(:submitted_timesheet))
  end

  test "should show submitted_timesheet" do
    get :show, id: @submitted_timesheet
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @submitted_timesheet
    assert_response :success
  end

  test "should update submitted_timesheet" do
    patch :update, id: @submitted_timesheet, submitted_timesheet: {  }
    assert_redirected_to submitted_timesheet_path(assigns(:submitted_timesheet))
  end

  test "should destroy submitted_timesheet" do
    assert_difference('SubmittedTimesheet.count', -1) do
      delete :destroy, id: @submitted_timesheet
    end

    assert_redirected_to submitted_timesheets_path
  end
end
