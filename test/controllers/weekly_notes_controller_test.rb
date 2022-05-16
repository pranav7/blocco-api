require "test_helper"

class WeeklyNotesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @weekly_note = weekly_notes(:one)
  end

  test "should get index" do
    get weekly_notes_url, as: :json
    assert_response :success
  end

  test "should create weekly_note" do
    assert_difference("WeeklyNote.count") do
      post weekly_notes_url, params: { weekly_note: { end_date: @weekly_note.end_date, notes: @weekly_note.notes, start_date: @weekly_note.start_date } }, as: :json
    end

    assert_response :created
  end

  test "should show weekly_note" do
    get weekly_note_url(@weekly_note), as: :json
    assert_response :success
  end

  test "should update weekly_note" do
    patch weekly_note_url(@weekly_note), params: { weekly_note: { end_date: @weekly_note.end_date, notes: @weekly_note.notes, start_date: @weekly_note.start_date } }, as: :json
    assert_response :success
  end

  test "should destroy weekly_note" do
    assert_difference("WeeklyNote.count", -1) do
      delete weekly_note_url(@weekly_note), as: :json
    end

    assert_response :no_content
  end
end
