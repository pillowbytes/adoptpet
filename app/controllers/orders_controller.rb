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
    @pet = Pet.find_by(id: params[:order][:pet_id])
    @order = current_user.orders.build(order_params)
    @order.pet = @pet

    if @order.save
      @order.pet.update(is_available: false) # Mark pet as unavailable
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

  def order_params
    params.require(:order).permit(:children_number,
                                  :responsible_for_pet,
                                  :house_type,
                                  :house_description,
                                  :pet_id).merge(
                                    family_agreement: ActiveModel::Type::Boolean
                                                      .new.cast(params[:order][:family_agreement]),
                                    other_pets_in_house: ActiveModel::Type::Boolean
                                                      .new.cast(params[:order][:other_pets_in_house])
    )
  end

  def set_order
    @order = current_user.orders.find_by(id: params[:id])
    redirect_to orders_path, alert: "Order not found." if @order.nil?
  end
end
