class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :item_category
  belongs_to_active_hash :item_sales_status
  belongs_to_active_hash :item_shipping_fee_status
  belongs_to_active_hash :item_prefecture
  belongs_to_active_hash :item_scheduled_delivery

  belongs_to :user
  has_one_attached :image

  validates :name, presence: true
  validates :info, presence: true
  validates :item_category_id, presence: true
  validates :item_sales_status_id, presence: true
  validates :item_shipping_fee_status_id, presence: true
  validates :item_prefecture_id, presence: true
  validates :item_scheduled_delivery_id, presence: true
  validates :image, presence: true
  validates :price, numericality: { only_integer: true, message: "Half-width characters" }
  validates :price, presence: true
  validates :price, numericality: { :greater_than_or_equal_to => 300, :less_than_or_equal_to => 9999999 }
  validates :item_category_id, :item_sales_status_id, :item_shipping_fee_status_id, :item_prefecture_id, :item_scheduled_delivery_id, numericality: { other_than: 1, message: "select" }
end
