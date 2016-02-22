require 'rails_helper'

	describe UsersController, :type => :controller do
		before do
			@user = User.create!(email: "jim@example.com", password: "jimspassword")
      @user = User.create!(email: "bob@example.com", password: "bobspassword")
		end

    describe "GET #show" do
      context "User is logged in" do
        before do
          sign_in @user
          it "loads correct user details" do
            expect(response).to be_success
            expect(response).to have_http_status(200)
            expect(assigns(:user)).to eq @user
          end
        end
      end

      describe "Get#login" do
        context "No user is logged in" do
          before do
            it "redirects to login" do
              get :show, id: @user.id
              expect(response).to redirect_to(root_path)
            end
          end
        end
      end
    end
		
	end