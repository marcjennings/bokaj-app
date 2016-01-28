class AddMarketNameToProducts < ActiveRecord::Migration
  def change
  	add_column :products, :market_name, :string
  end
end
