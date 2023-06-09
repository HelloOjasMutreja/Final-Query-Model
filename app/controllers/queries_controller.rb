class QueriesController < ApplicationController
  before_action :set_query, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: %i[new edit]

  # GET /queries or /queries.json
  def index
    @queries = Query.all.order('created_at DESC')
  end

  def show
    @query = Query.find(params[:id])
    @query_option = @query.query_options.build
    @option = @query_option.build_option
  end

  def new
    @query = current_user.queries.build
    @options = @query.options.build
  end

  def edit
  end

  def create
    @query = current_user.queries.build(query_params)

    respond_to do |format|
      if @query.save
        format.html { redirect_to query_url(@query), notice: "Query was successfully created." }
        format.json { render :show, status: :created, location: @query }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @query.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @query.update(query_params)
        if params[:query] && params[:query][:query_option] && params[:query][:query_option][:option] && params[:query][:query_option][:option][:content]
          @query_option = @query.query_options.build(option_attributes: { query_id: @query.id, content: params[:query][:query_option][:option][:content] })
          if @query_option.save
            format.html { redirect_to query_url(@query), notice: 'Option was successfully Added.' }
            format.json { render :show, status: :ok, location: @query }
          else
            format.html { render :edit }
            format.json { render json: @query.errors, status: :unprocessable_entity }
          end
        else
          format.html { redirect_to query_url(@query), alert: 'Option was not added.' }
          format.json { render :show, status: :ok, location: @query }
        end
      else
        format.html { render :edit }
        format.json { render json: @query.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @query.destroy

    respond_to do |format|
      format.html { redirect_to queries_url, notice: "Query was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def transfer
    @query = Query.find(params[:id])
    daily_query = DailyQuery.create(title: @query.title, user: @query.user)

    @query.options.each do |option|
      daily_query.options << option
    end

    @query.destroy
    redirect_to daily_queries_path
  end

  private

  def set_query
    @query = Query.find(params[:id])
  end

  def query_params
    params.require(:query).permit(:title, :id, query_options_attributes:
      [:id, { options_attributes: %i[id content _destroy] }])
  end   
end
