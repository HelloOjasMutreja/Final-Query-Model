class OptionsController < ApplicationController
  before_action :set_option, only: %i[ edit update destroy ]

  def new
    @query = Query.find(params[:query_id])
    @option = @query.options.build
  end

  def create
    @query = Query.find(params[:query_id])
    @option = @query.options.new(option_params)
    if @option.save
      redirect_to query_path(@query)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @option.update(option_params)
      redirect_to query_path(@option.query)
    else
      render 'edit'
    end
  end

  def destroy
    @query = params[:query_id]
    @option.destroy
    redirect_to query_path(@query)
  end

  def random
    @query = Query.find(params[:query_id])
    @option = @query.options.sample
  end

  private
  
    def set_option
      @option = Option.find_by(query_id: params[:query_id], id: params[:id])
    end

    def option_params
      params.require(:options).permit(:query_id, :answer)
    end
end
