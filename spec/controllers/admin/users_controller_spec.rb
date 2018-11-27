require 'rails_helper'

RSpec.describe Admin::UsersController, :type => :controller do

  describe "GET index" do

      login_admin

      it "assigns @users" do
        user = FactoryBot.create(:user)
        get :index
        expect(assigns(:users)).to eq([subject.current_user,user])
      end
  
      it "renders the index template" do
        get :index
        expect(response).to render_template("index")
      end

    end

  end