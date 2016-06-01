class Report < ActiveRecord::Base
  has_and_belongs_to_many :confirmed_issues

  enum category: ["Pothole", "Sidewalk", "Streetlight", "Traffic Signal", "Signage",
                  "Road Obstruction", "Pavement", "Powerline", "Vandalism", "Animal Control",
                  "Other"]
  enum status: [:active, :confirmed, :flagged, :deleted, :hidden]
  enum danger_level: ["Mild", "Moderate", "Severe"]
end
