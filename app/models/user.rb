class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

  validates :nickname, presence: true
  validates :birth_date, presence: true
  validates :password, confirmation: true
  validates :email, uniqueness: true
  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: "@ Including" }


  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'Full-width characters' } do
    validates :first_name
    validates :last_name
  end

  with_options presence: true, format: { with: /\A[ァ-ン]+\z/, message: 'Full-width katakana characters' } do
    validates :first_name_kana
    validates :last_name_kana
  end

  validates :password, presence: true, 
  format: { with: /\A(?=.*?[a-z])(?=.*?[\d])\w{6,12}\z/, message: "Password Include both letters and numbers" }
end
