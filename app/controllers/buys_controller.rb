class BuysController < ApplicationController

  def index
    @furima = Furima.find(params[:furima_id])
    @purchase_buy = PurchaseBuy.new
  end

  def create
    @furima = Furima.find(params[:furima_id])
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
    params.require(:purchase_buy).permit(:postal_code, :prefecture_id, :city, :address, :phone).merge(user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
