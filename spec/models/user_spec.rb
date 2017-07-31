require 'rails_helper'

RSpec.describe User, type: :model do
  describe "#valid?" do
    let(:user) { FactoryGirl.build(:user, params) }

    context "should be valid" do
      let(:params) { {} }

      it { expect(user).to be_valid }
    end

    context "name should be present" do
      let(:params) { { name: "" } }

      it { expect(user).not_to be_valid }
    end

    context "email should be present" do
      let(:params) { { email: "" } }

      it { expect(user).not_to be_valid }
    end

    context "email should reject invalid format" do
      let(:params) { { email: "user@example,com" } }

      it { expect(user).not_to be_valid }
    end

    context "email should be unique" do
      let(:email) { "same@example.com" }
      let(:params) { { email: email } }

      before do
        FactoryGirl.create(:user, email: email.upcase)
      end

      it { expect(user).not_to be_valid }
    end
  end
end
