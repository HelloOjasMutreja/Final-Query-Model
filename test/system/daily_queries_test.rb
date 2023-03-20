require "application_system_test_case"

class DailyQueriesTest < ApplicationSystemTestCase
  setup do
    @daily_query = daily_queries(:one)
  end

  test "visiting the index" do
    visit daily_queries_url
    assert_selector "h1", text: "Daily queries"
  end

  test "should create daily query" do
    visit daily_queries_url
    click_on "New daily query"

    fill_in "Title", with: @daily_query.title
    fill_in "User", with: @daily_query.user_id
    click_on "Create Daily query"

    assert_text "Daily query was successfully created"
    click_on "Back"
  end

  test "should update Daily query" do
    visit daily_query_url(@daily_query)
    click_on "Edit this daily query", match: :first

    fill_in "Title", with: @daily_query.title
    fill_in "User", with: @daily_query.user_id
    click_on "Update Daily query"

    assert_text "Daily query was successfully updated"
    click_on "Back"
  end

  test "should destroy Daily query" do
    visit daily_query_url(@daily_query)
    click_on "Destroy this daily query", match: :first

    assert_text "Daily query was successfully destroyed"
  end
end
