require 'rails_helper'

RSpec.describe Api::V1::CommentsController, type: :controller do
  let(:my_user) { create(:user) }
  let(:my_topic) { create(:topic) }
  let(:my_post) { create(:post) }
  let(:my_comment) { Comment.create!(body: 'Comment Body', post: my_post, user: my_user) }

  context "unauthenticated users" do
    it "GET index returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
    it "GET show returns http sucess" do
      get :show, post_id: my_post.id, id: my_comment.id
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
    it "GET show returns http sucess" do
      get :show, post_id: my_post.id, id: my_comment.id
      expect(response).to have_http_status(:success)
    end
  end
end
