class DailyQueriesController < ApplicationController
  before_action :set_daily_query, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: %i[new edit]

  # GET /daily_queries or /daily_queries.json
  def index
    @daily_queries = DailyQuery.all.order('created_at DESC')
  end

  # GET /daily_queries/1 or /daily_queries/1.json
  def show
    @daily_query = DailyQuery.find(params[:id])
    @daily_query_option = @daily_query.daily_query_options.build
    @option = @daily_query_option.build_option
  end

  # GET /daily_queries/new
  def new
    @daily_query = current_user.daily_queries.build
    @options = @daily_query.options.build
  end

  # GET /daily_queries/1/edit
  def edit
  end

  # POST /daily_queries or /daily_queries.json
  def create
    @daily_query = current_user.daily_queries.build(daily_query_params)

    respond_to do |format|
      if @daily_query.save
        format.html { redirect_to daily_query_url(@daily_query), notice: "Daily query was successfully created." }
        format.json { render :show, status: :created, location: @daily_query }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @daily_query.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /daily_queries/1 or /daily_queries/1.json
  def update
    @daily_query = DailyQuery.find(params[:id])
    
    respond_to do |format|
      if @daily_query.update(daily_query_params)
        format.html { redirect_to daily_query_url(@daily_query), notice: "Daily query was successfully updated." }
        format.json { render :show, status: :ok, location: @daily_query }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @daily_query.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /daily_queries/1 or /daily_queries/1.json
  def destroy
    @daily_query.destroy

    respond_to do |format|
      format.html { redirect_to daily_queries_url, notice: "Daily query was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_daily_query
      @daily_query = DailyQuery.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def daily_query_params
      params.require(:daily_query).permit(:title, :id, query_options_attributes:
        [:id, { options_attributes: %i[id content _destroy] }])
    end
end
