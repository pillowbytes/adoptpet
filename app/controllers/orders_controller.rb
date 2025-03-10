class OrdersController < ApplicationController
  def index
  end

  def show
    @order = Pet.find(params[:id])
  end

  def new
  end

  def create
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to orders_path
  end

  private

  def orders_params
    params.require(:order).permit(:user, :pet)
  end
end
