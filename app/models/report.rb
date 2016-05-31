class Report < ActiveRecord::Base
  enum status: [:active, :confirmed, :flagged, :deleted, :hidden]
end
