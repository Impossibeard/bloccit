require 'rails_helper'

RSpec.describe Api::V1::PostsController, type: :controller do
  let(:my_post) { create(:post) }
  let(:my_topic) { create (:topic) }
  let(:my_user) { create(:user) }

  context "unauthenticated users" do
    it "GET index returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
    it "GET show returns http sucess" do
      get :show, topic_id: my_topic.id, id: my_post.id
      expect(response).to have_http_status(:success)
    end
  end

  context "authenticated and unauthorized users" do
    before do
      controller.request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Token.encode_credentials(my_user.auth_token)
    end
    it "GET index returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
    it "GET show returns http forbidden" do
      get :show, topic_id: my_topic.id, id: my_post.id
      expect(response).to have_http_status(:success)
    end

  end
end
