class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: [:show, :destroy]

  def index
  end

  def show
  end

  def new
  end

  def create
    # make sure to change @pet.is_available? to false
  end

  def destroy
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
