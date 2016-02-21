require 'rails_helper'

  describe Product do
    context "when the product has comments" do
      before do
        @product = Product.create!(market_name: "10k", name: "10k")
        @user = User.create!(email: "bob@gmail.com", password: "bobspassword")
        @product.comments.create!(rating: 1, user: @user, body: "Awful run!")
        @product.comments.create!(rating: 3, user: @user, body: "Average run!")
        @product.comments.create!(rating: 5, user: @user, body: "A good run!")
      end
        it "returns the average rating of all comments" do
        expect(@product.average_rating).to eq 3
        end

        it  "is not valid" do
        expect(Product.new(description: "Nice run")).not_to be_valid
        end
    end
  end