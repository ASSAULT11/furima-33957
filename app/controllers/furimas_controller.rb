class FurimasController < ApplicationController
  def index
    @furimas = Furima.all
  end

  def new
    @furima = Furima.new
  end

  def create
    @furima = Furima.new(prototype_params)
    if @furima.valid?
      @furima.save
      redirect_to root_path
    else
      render "new"
    end
  end

  private
  def tweet_params
    params.require(:furima).permit(:item, :image, :text, :category_id, :state_id, :shipping_id, :area_id, :send_day_id, :price).merge(user_id: current_user.id)
  end
end