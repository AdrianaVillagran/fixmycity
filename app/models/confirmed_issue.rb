class ConfirmedIssue < ActiveRecord::Base
  has_and_belongs_to_many :reports

  enum category: ["Pothole", "Sidewalk", "Streetlight", "Traffic Signal", "Signage",
                  "Road Obstruction", "Pavement", "Powerline", "Vandalism", "Animal Control",
                  "Other"]
  enum status: [:pending, :in_progress, :closed, :hidden]
  enum danger_level: ["Mild", "Moderate", "Severe"]
end
