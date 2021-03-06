class Report < ActiveRecord::Base
  has_and_belongs_to_many :confirmed_issues

  geocoded_by :address
  after_validation :geocode, :if => :address_changed?

  enum category: ["Pothole", "Sidewalk", "Streetlight", "Traffic Signal", "Signage",
                  "Road Obstruction", "Pavement", "Powerline", "Vandalism", "Animal Control",
                  "Other"]
  enum status: [:active, :confirmed, :flagged, :deleted, :hidden]
  enum danger_level: ["Mild", "Moderate", "Severe"]

  def report_with_id
    "Report ##{id}"
  end
end
