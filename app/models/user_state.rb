class UserState < ApplicationRecord
    belongs_to :state
    belongs_to :user
  end
