require 'rails_helper'

RSpec.describe "UserSignups", type: :request do
  describe "POST /signup" do
    context "invalid signup information" do
      before do
        get signup_path
        post signup_path, params: { user: { name: "", email: "user@example,com",
                                            password: "foo", password_confirmation: "bar" } }
      end

      it do
        aggregate_failures do
          expect(response).to render_template('users/new')
          expect(response.body).to match(/<div[^>]+id='error_explanation'/)
          expect(response.body).to match(/<div[^>]+class='alert/)
        end
      end
    end

    context "valid signup information" do
      before do
        get signup_path
        post signup_path, params: { user: { name: "example", email: "user@example.com",
                                            password: "password", password_confirmation: "password" } }
      end

      let(:user) { assigns(:user) }

      it do
        aggregate_failures do
          expect(User.first).to eq(user)
          expect(flash).not_to be_empty
        end
      end
    end
  end
end
