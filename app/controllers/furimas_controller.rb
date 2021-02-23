class FurimasController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_furima, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]
  before_action :out_to_index, only: [:edit, :update, :destroy]

  def index
    @furimas = Furima.all.order("created_at DESC")
  end

  def new
    @furima = Furima.new
  end

  def create
    @furima = Furima.new(furima_params)
    if @furima.save
      redirect_to root_path
    else
      render "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @furima.update(furima_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @furima.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private
  def furima_params
    params.require(:furima).permit(:item, :image, :text, :category_id, :state_id, :shipping_id, :area_id, :send_day_id, :price).merge(user_id: current_user.id)
  end

  def set_furima
    @furima = Furima.find(params[:id])
  end

  def move_to_index
    unless @furima.user_id == current_user.id
      redirect_to action: :index
    end
  end

  def out_to_index
    if @furima.purchase.present?
      redirect_to root_path
    end
  end

end