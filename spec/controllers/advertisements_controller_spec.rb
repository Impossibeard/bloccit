require 'rails_helper'

RSpec.describe AdvertisementsController, type: :controller do

let (:test_advertisement) { Advertisement.create!(title: "Power Thirst!", copy: "Hey, do you wanna feel so energetic? Try Powerthirst. Energy drinks for people who need gratuitous amounts of energy. With all new flavors like Shockolate. Shockolate energy, it’s like adding chocolate to an electrical storm. Sound the alarm, you’re gonna be uncomfortably energetic.", price: 500)}

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns [test_advertisement] to @advertisements" do
      get :index
      expect(assigns(:advertisements)).to eq([test_advertisement])
    end
  end


  describe "GET show" do
    it "returns http success" do
      get :show, {id: test_advertisement.id}
      expect(response).to have_http_status(:success)
    end
    it "renders the #show view" do
# #17
      get :show, {id: test_advertisement.id}
      expect(response).to render_template :show
    end

    it "assigns test_advertisement to @advertisement" do
      get :show, {id: test_advertisement.id}
# #18
      expect(assigns(:advertisement)).to eq(test_advertisement)
    end
  end

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
    it "renders the #new view" do
      get :new
      expect(response).to render_template :new
    end
    it "instantiates new @advertisement" do
      get :new
      expect(assigns(:advertisement)).not_to be_nil
    end
  end

  describe "POST create" do
    it "increases the number of advertisements by 1" do
      expect{post :create, advertisement: {title: "Powerthirst!", copy: "Hey, do you wanna feel so energetic? Try Powerthirst. Energy drinks for people who need gratuitous amounts of energy. With all new flavors like Shockolate. Shockolate energy, it’s like adding chocolate to an electrical storm. Sound the alarm, you’re gonna be uncomfortably energetic.", price: 500}}.to change(Advertisement, :count).by(1)
    end
    it "assigns the new advertisement to @advertisement" do
      post :create, advertisement: {title: "Powerthirst!", copy: "Hey, do you wanna feel so energetic? Try Powerthirst. Energy drinks for people who need gratuitous amounts of energy. With all new flavors like Shockolate. Shockolate energy, it’s like adding chocolate to an electrical storm. Sound the alarm, you’re gonna be uncomfortably energetic.", price: 500}
      expect(assigns(:advertisement)).to eq Advertisement.last
    end
    it "redirects to the new advertisement" do
      post :create, advertisement: {title: "Powerthirst!", copy: "Hey, do you wanna feel so energetic? Try Powerthirst. Energy drinks for people who need gratuitous amounts of energy. With all new flavors like Shockolate. Shockolate energy, it’s like adding chocolate to an electrical storm. Sound the alarm, you’re gonna be uncomfortably energetic.", price: 500}
      expect(response).to redirect_to Advertisement.last
    end
  end

end
