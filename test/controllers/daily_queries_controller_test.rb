require "test_helper"

class DailyQueriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @daily_query = daily_queries(:one)
  end

  test "should get index" do
    get daily_queries_url
    assert_response :success
  end

  test "should get new" do
    get new_daily_query_url
    assert_response :success
  end

  test "should create daily_query" do
    assert_difference("DailyQuery.count") do
      post daily_queries_url, params: { daily_query: { title: @daily_query.title, user_id: @daily_query.user_id } }
    end

    assert_redirected_to daily_query_url(DailyQuery.last)
  end

  test "should show daily_query" do
    get daily_query_url(@daily_query)
    assert_response :success
  end

  test "should get edit" do
    get edit_daily_query_url(@daily_query)
    assert_response :success
  end

  test "should update daily_query" do
    patch daily_query_url(@daily_query), params: { daily_query: { title: @daily_query.title, user_id: @daily_query.user_id } }
    assert_redirected_to daily_query_url(@daily_query)
  end

  test "should destroy daily_query" do
    assert_difference("DailyQuery.count", -1) do
      delete daily_query_url(@daily_query)
    end

    assert_redirected_to daily_queries_url
  end
end
