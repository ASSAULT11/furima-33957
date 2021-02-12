class FurimasController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index,]

  def index
    @furimas = Furima.all
    @furimas = Furima.order("created_at DESC")
  end

  def new
    @furima = Furima.new
  end

  def create
    @furima = Furima.new(furima_params)
    if @furima.valid?
      @furima.save
      redirect_to root_path
    else
      render "new"
    end
  end

  private
  def furima_params
    params.require(:furima).permit(:item, :image, :text, :category_id, :state_id, :shipping_id, :area_id, :send_day_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    @furima = Furima.find(params[:id])
    unless furima.user_id == current_user.id
      redirect_to action: :index
    end
  end
end