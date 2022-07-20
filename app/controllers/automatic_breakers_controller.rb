class AutomaticBreakersController < ApplicationController

  def new
    @automatic_breaker=AutomaticBreaker.new
  end

  def create
    @automatic_breaker=AutomaticBreaker.new(automatic_breaker_params)

    if @automatic_breaker.save
      redirect_to automatic_breakers_path
    else
      render :new
    end
  end

  def index
    #@automatic_breakers=AutomaticBreaker.order(:nominal_current)
    @q = AutomaticBreaker.ransack(params[:q])
    @automatic_breakers = @q.result(distinct: true).order(created_at: :desc)

  end

  def show
    @automatic_breaker=AutomaticBreaker.find(params[:id])
  end


  def automatic_breaker_params
    params.require(:automatic_breaker).permit(:phases,:nominal_current,:characteristic,:breaking_capacity,:manufacturer)
  end

end
