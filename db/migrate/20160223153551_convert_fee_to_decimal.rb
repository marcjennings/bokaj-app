class ConvertFeeToDecimal < ActiveRecord::Migration
  def change
  	Product.all.each do |p|
  		p.fee = nil
  		p.save!
  	end

  	change_column :products, :fee, :decimal, default: 0.0
  end
end
