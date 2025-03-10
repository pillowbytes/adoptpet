class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Pet.find(params[:id])
  end

  def new
  end

  def create
  end

  def destroy
  end

  private

  def orders_params
    params.require(:order).permit(:user, :pet)
  end
end
