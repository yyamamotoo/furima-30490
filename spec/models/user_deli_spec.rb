require 'rails_helper'

RSpec.describe UserDeli, type: :model do
  describe 'token,配送先の保存' do
    before do
      @user_deli = FactoryBot.build(:user_deli)
    end

    it 'すべての値が正しく入力されていれば保存できる' do
      expect(@user_deli).to be_valid
    end
    it 'postal_codeが空だと保存できない' do
      @user_deli.postal_code = ""
      @user_deli.valid?
      expect(@user_deli.errors.full_messages).to include("Postal code can't be blank", "Postal code Please enter in half-width numbers including hyphens(-)")
    end
    it 'postal_codeが全角だと保存できない' do
      @user_deli.postal_code = "１１１ー１１１１"
      @user_deli.valid?
      expect(@user_deli.errors.full_messages).to include("Postal code Please enter in half-width numbers including hyphens(-)")
    end
    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できない' do
      @user_deli.postal_code = "1112222"
      @user_deli.valid?
      expect(@user_deli.errors.full_messages).to include("Postal code Please enter in half-width numbers including hyphens(-)")
    end

    it 'postal_codeが数字と-以外では保存できない' do
      @user_deli.postal_code = "郵便番号"
      @user_deli.valid?
      expect(@user_deli.errors.full_messages).to include("Postal code Please enter in half-width numbers including hyphens(-)")
    end
    
    it 'prefecture_idが1だと保存できない' do
      @user_deli.prefecture_id = "1"
      @user_deli.valid?
      expect(@user_deli.errors.full_messages).to include("Prefecture select")
    end
    it 'cityが空だと保存できない' do
      @user_deli.city = ""
      @user_deli.valid?
      expect(@user_deli.errors.full_messages).to include("City can't be blank")
    end
    it 'addressesが空だと保存できない' do
      @user_deli.addresses = ""
      @user_deli.valid?
      expect(@user_deli.errors.full_messages).to include("Addresses can't be blank")
    end
    
    it 'buildingが空でも保存できる' do
      @user_deli.building = nil
      expect(@user_deli).to be_valid
    end
    it 'phone_numberが空だと保存できない' do
      @user_deli.phone_number = ""
      @user_deli.valid?
      expect(@user_deli.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'phone_numberが全角だと保存できない' do
      @user_deli.phone_number = "０８０１１１１２２２２"
      @user_deli.valid?
      expect(@user_deli.errors.full_messages).to include("Phone number Please enter 10 to 11 Half-width characters numbers")
    end

    it 'phone_numberが数字以外だと保存できない' do
      @user_deli.phone_number = "電話番号"
      @user_deli.valid?
      expect(@user_deli.errors.full_messages).to include("Phone number Please enter 10 to 11 Half-width characters numbers")
    end

    it 'phone_numberが12桁以上だと保存できない' do
      @user_deli.phone_number = "0801111222233"
      @user_deli.valid?
      expect(@user_deli.errors.full_messages).to include("Phone number Please enter 10 to 11 Half-width characters numbers")
    end

    it "tokenが空では登録できないこと" do
      @user_deli.token = nil
      @user_deli.valid?
      expect(@user_deli.errors.full_messages).to include("Token can't be blank")
    end
    
  end
end
