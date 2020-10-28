class UserDeli
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code
    validates :prefecture_id
    validates :city
    validates :addresses
    validates :phone_number
    validates :token
  end

  validates :prefecture_id, numericality: { other_than: 1, message: "select" }
  validates :phone_number, format: { with: /\A0\d{9,10}\z/, message: "Please enter 10 to 11 Half-width characters numbers" }
  validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "Please enter in half-width numbers including hyphens(-)" }

  def save
    # ユーザーの情報を保存し、「user」という変数に入れている
    purchaser = Purchaser.create(user_id: user_id, item_id: item_id)
    # 住所の情報を保存
    Deliverie.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, addresses: addresses, building: building, phone_number: phone_number, purchaser_id: purchaser.id)
  end
end
