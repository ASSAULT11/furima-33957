class BuysController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_furima, only: [:index, :create]
  before_action :move_to_index, only: [:index]

  def index
    @purchase_buy = PurchaseBuy.new
  end

  def create
    @purchase_buy = PurchaseBuy.new(purchase_params)
    if @purchase_buy.valid?
      pay_item
      @purchase_buy.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_buy).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone).merge(user_id: current_user.id,furima_id: params[:furima_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @furima.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end
  
  def set_furima
    @furima = Furima.find(params[:furima_id])
  end

  def move_to_index
    if @furima.user_id == current_user.id
      redirect_to root_path
    end
  end
end
