class OrdersController < ApplicationController
  def index
  end

  def show
    @order = Pet.find(params[:id])
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)

    if @order.save
      redirect_to order_path(@order), notice: "Cadastro de adoção criado!"
    else
      render :new
    end
  end

  def destroy
  end

  private

  def orders_params
    params.require(:order).permit(:user, :pet)
  end
end
