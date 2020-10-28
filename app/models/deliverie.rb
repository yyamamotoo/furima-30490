class Deliverie < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :deliverie_prefecture

  belongs_to :purchaser
end
