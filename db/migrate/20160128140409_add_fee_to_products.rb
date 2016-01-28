class AddFeeToProducts < ActiveRecord::Migration
  def change
    add_column :products, :fee, :string
  end
end
