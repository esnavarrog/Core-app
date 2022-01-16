class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  def self.localized_name
    "activerecord.attributes.#{table_name}"
  end
end
