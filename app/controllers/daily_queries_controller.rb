class DailyQueriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @daily_queries = current_user.daily_queries.includes(:query)
  end

  def create
    query = Query.find(params[:query_id])
    daily_query = current_user.daily_queries.new(query: query)

    if daily_query.save
      flash[:notice] = "Query added to daily list"
    else
      flash[:alert] = "Error adding query to daily list"
    end

    redirect_to queries_path
  end

  def destroy
    daily_query = current_user.daily_queries.find(params[:id])

    if daily_query.destroy
      flash[:notice] = "Query removed from daily list"
    else
      flash[:alert] = "Error removing query from daily list"
    end

    redirect_to daily_queries_path
  end
end