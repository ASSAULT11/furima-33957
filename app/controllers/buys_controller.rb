class BuysController < ApplicationController

  def index
  end

  def create
    #@buy = Buy.new(buy_params)
    #if .valid?
     # .save
      #return redirect_to root_path
    #else
      #render 'index'
    #end
  end

  private

  def order_params
    params.require(:buy).permit(:postal_code, :prefectures_id, :city, :address, :phone).merge(user_id: current_user.id)
  end
end