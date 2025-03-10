class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: [:show, :destroy]

  def index
    @orders = current_user.orders
  end

  def show
    @order = current_user.orders.find_by(id: params[:id])
    redirect_to orders_path, alert: "Order not found." if @order.nil?
  end

  def new
    @pet = Pet.find(params[:pet_id])
    @order = current_user.orders.build(pet: @pet)
  end

  def create
    @order = @pet.orders.build(order_params)
    @order.user = current_user

    if @order.save
      @pet.update(is_available: false) # making sure to change @pet.is_available? to false
      redirect_to order_path(@order), notice: "Formulário enviado com sucesso ✅"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to orders_path
  end

  private

  def orders_params
    params.require(:order).permit(:children_number,
                                  :family_agreement,
                                  :other_pets_in_house,
                                  :responsible_for_pet,
                                  :house_type,
                                  :house_description,
                                  :pet_id)
  end

  def set_order
    @order = current_user.orders.find_by(id: params[:id])
    redirect_to orders_path, alert: "Order not found." if @order.nil?
  end
end
