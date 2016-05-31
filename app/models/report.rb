class Report < ActiveRecord::Base
  has_and_belongs_to_many :confirmed_issues

  enum status: [:active, :confirmed, :flagged, :deleted, :hidden]
end
