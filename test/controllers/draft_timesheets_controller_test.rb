require 'test_helper'

class DraftTimesheetsControllerTest < ActionController::TestCase
  setup do
    @draft_timesheet = draft_timesheets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:draft_timesheets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create draft_timesheet" do
    assert_difference('DraftTimesheet.count') do
      post :create, draft_timesheet: {  }
    end

    assert_redirected_to draft_timesheet_path(assigns(:draft_timesheet))
  end

  test "should show draft_timesheet" do
    get :show, id: @draft_timesheet
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @draft_timesheet
    assert_response :success
  end

  test "should update draft_timesheet" do
    patch :update, id: @draft_timesheet, draft_timesheet: {  }
    assert_redirected_to draft_timesheet_path(assigns(:draft_timesheet))
  end

  test "should destroy draft_timesheet" do
    assert_difference('DraftTimesheet.count', -1) do
      delete :destroy, id: @draft_timesheet
    end

    assert_redirected_to draft_timesheets_path
  end
end
