class Bill < ActiveRecord::Base
  paginates_per 5

  has_many :user_bills
end
