class SalesStatus < ApplicationRecord
  include ActiveHash::Associations
  has_many :items
end
