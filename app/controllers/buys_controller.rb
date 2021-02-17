class BuysController < ApplicationController

  def create
    @buy = Buy.new(buy_params)
    if @order.valid?
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:buy).permit(:postal_code, :prefectures_id, :city, :address, :phone).merge(user_id: current_user.id)
  end
end