class User < ApplicationRecord
    has_many :user_bills
    has_many :user_categories
    has_many :user_states
end
