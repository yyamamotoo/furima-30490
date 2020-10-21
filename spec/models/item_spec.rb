# encoding: utf-8
require "rails_helper"

RSpec.describe Item, type: :model do
  describe "#create" do
    before do
      @item = FactoryBot.build(:item)
    end

    it "全項目が存在すれば登録できる" do
      expect(@item).to be_valid
    end

    it "nameが空だと登録できない" do
      @item.name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it "infoが空では登録できない" do
      @item.info = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Info can't be blank")
    end

    it "item_category_idが1では登録できない" do
      @item.item_category_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Item category select")
    end

    it "item_sales_status_idが1では登録できない" do
      @item.item_sales_status_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Item sales status select")
    end

    it "item_shipping_fee_status_idが1では登録できない" do
      @item.item_shipping_fee_status_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Item shipping fee status select")
    end

    it "item_prefecture_idが1では登録できない" do
      @item.item_prefecture_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Item prefecture select")
    end

    it "item_scheduled_delivery_idが1では登録できない" do
      @item.item_scheduled_delivery_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Item scheduled delivery select")
    end

    it "priceが300以下だと登録できない" do
      @item.price = "299"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end

    it "priceが空だと登録できない" do
      @item.price = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it "priceが9999999以上だと登録できない" do
      @item.price = "10000000"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end

    it "priceが全角だと登録できない" do
      @item.price = "９９９"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Half-width characters")
    end

    it "imageが空だと登録できない" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
  end
end
