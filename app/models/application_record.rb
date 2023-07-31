class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
  # paginates_per 5

  def self.search(search_params)
    where("name ILIKE ?", "%#{search_params}%")
  end
end
