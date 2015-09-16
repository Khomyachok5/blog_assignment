require 'rails_helper'
require 'devise'

RSpec.describe AdminsController, type: :controller do

  describe 'POST#invalidate' do
    context 'when user is authorized and is an admin' do
      let!(:user) { FactoryGirl.create(:user) }
      let(:invalid_admin) { FactoryGirl.create(:invalid_admin) }
      before (:each) do
        sign_in user
        post :invalidate, {id: invalid_admin.id, count: 2}
      end

      it "voids an invalid_admin of admin privileges" do
        expect(invalid_admin.reload.is_admin).to be_falsey
      end
    end

    context 'user is authorized and not an admin' do
      let!(:user) { FactoryGirl.create(:user) }
      let(:non_admin) { FactoryGirl.create(:non_admin) }
      before (:each) do
        sign_in non_admin
        post :invalidate, {id: user, count: 2}
      end
      
      it "doesn't void a user of admin privileges" do
        expect(user.reload.is_admin).to be_truthy
      end
    end

    context 'when the user is not authorized' do
      let!(:user) { FactoryGirl.create(:user) }
      let(:unauthorized_user) { FactoryGirl.create(:unauthorized_user) }
      before (:each) do
        sign_in nil
        post :invalidate, {id: user, count: 2}
      end

      it "redirects to the main page" do
        expect(subject).to redirect_to root_path
      end

      it "and sets an appropriate flash message" do
        set_flash[:alert].to("This action is only available for administrators")
      end  
    end
  end


  describe "POST#promote" do
    context 'when user is authorized and is an admin' do
      let!(:user) { FactoryGirl.create(:user) }
      let(:non_admin) { FactoryGirl.create(:non_admin) }
      before (:each) do
        sign_in user
        post :promote, {id: non_admin}
      end
      
      it "grants admin privileges to a regular user" do
        expect(non_admin.reload.is_admin).to be_truthy
      end
    end

    context 'when the user is not authorized' do
      let!(:unauthorized_user) { FactoryGirl.create(:unauthorized_user) }
      before (:each) do
        sign_in nil
        post :promote, {id: unauthorized_user}
      end

      it "doesn't grant admin privileges to a regular user" do
        expect(unauthorized_user.reload.is_admin).to be_falsey
      end
    end
  end
end