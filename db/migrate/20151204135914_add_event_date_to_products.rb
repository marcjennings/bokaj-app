class AddEventDateToProducts < ActiveRecord::Migration
  def change
  	add_column :products, :event_date, :datetime
  end
end
