class ConvertFeeToDecimal < ActiveRecord::Migration
  def change
  	Product.all.each do |p|
  		p.fee = nil
  		p.save!
  	end
    if Rails.env.production?
  		change_column :products, :fee, 'numeric(10,2) USING CAST(fee as numeric(10,2))'
  	else
      change_column :products, :fee, :decimal, default: 0.0
    end
  end
end