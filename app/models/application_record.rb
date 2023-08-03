class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def self.search(search_params)
    where("name ILIKE ?", "%#{search_params}%")
  end
end
