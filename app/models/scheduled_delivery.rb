class ScheduledDelivery < ApplicationRecord
  include ActiveHash::Associations
  has_many :items
end
