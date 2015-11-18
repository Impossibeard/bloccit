require 'rails_helper'

RSpec.describe Advertisement, type: :model do
  let (:test_ad) {Advertisement.create!(title: "Power Thirst!", copy: "Hey, do you wanna feel so energetic? Try Powerthirst. Energy drinks for people who need gratuitous amounts of energy. With all new flavors like Shockolate. Shockolate energy, it’s like adding chocolate to an electrical storm. Sound the alarm, you’re gonna be uncomfortably energetic.", price: 500)}

  describe "attributes" do
    it "should respond to title" do
      expect(test_ad).to respond_to(:title)
    end
    it "should respond to copy" do
      expect(test_ad).to respond_to(:copy)
    end
    it "should respond to price" do
      expect(test_ad).to respond_to(:price)
    end
  end
end
