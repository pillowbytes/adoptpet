class AddDetailsToOrders < ActiveRecord::Migration[7.1]
  def change
    add_column :orders, :children_number, :integer
    add_column :orders, :family_agreement, :boolean
    add_column :orders, :other_pets_in_house, :boolean
    add_column :orders, :responsible_for_pet, :string
    add_column :orders, :house_type, :string
    add_column :orders, :house_description, :text
  end
end
