class PortfoliosController < ApplicationController
  before_action :set_portfolio_item, only: [:edit, :update, :show, :destroy]
  layout "portfolio"
  access all: [:show, :index, :angular, :rails], user: {except: [:destroy, :new, :create, :update, :edit, :sort]}, site_admin: :all
  def index
    @portfolio_item = Portfolio.by_position.page(params[:page]).per(9)
  end
  
  def sort
    params[:order].each do |key, value|
     Portfolio.find(value[:id]).update(position: value[:position])
    end
    
    render nothing: true
  end
  
  def angular
    @angular_portfolio_item = Portfolio.angular_portfolio.page(params[:page]).per(9)
  end
  
  def rails
    @rails_portfolio_item = Portfolio.rails_portfolio.page(params[:page]).per(9)
  end
  
  def new
    @portfolio_item = Portfolio.new
    3.times {@portfolio_item.technologies.build}
  end
  
  def create
    @portfolio_item = Portfolio.new(portfolio_params)
    respond_to do |format|
      if @portfolio_item.save
        format.html {redirect_to portfolios_path, notice: 'Your portfolio item is now active.'}
      else
        format.html {render :new}
      end
    end
  end
  
  def edit
  end
  
  def update
    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end
  
  def show
  end
  
  def destroy
     @portfolio_item.destroy
     respond_to do |format|
       format.html {redirect_to portfolios_url, notice: 'Portfolio was deleted.' }
     end
  end
  
  private
  def portfolio_params
    params.require(:portfolio).permit(:title, :subtitle, :body, technologies_attributes: [:name])
  end
  
  def set_portfolio_item
    @portfolio_item = Portfolio.find(params[:id])
  end
end
