class OrdersController < ApplicationController
  def index
    @orders = current_user.orders
  end

  def show
    @order = Pet.find(params[:id])
  end

  def new
    @order = @current_user.orders.build
  end

  def create
    @order = @current_user.orders.build(order_params)

    if @order.save
      redirect_to order_path(@order), notice: "Formulário enviado com sucesso ✅"
    else
      render :new, status: :unprocessable_entity
    end
    # final trocar o status de is_available = false
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
