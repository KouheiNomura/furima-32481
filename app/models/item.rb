class Item < ApplicationRecord
  with_options presence: true do
    validates :image
    validates :name
    validates :info
    validates :price, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, format: {/\A\d\z/}
    with_options numericality: {other_than: 0} do
      validates :category_id
      validates :sales_status_id
      validates :shopping_fee_status_id
      validates :prefecture_id
      validates :scheduled_delivery_id
    end
  end
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :sales_status
  belongs_to_active_hash :shopping_fee_status
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :scheduled_delivery
end
