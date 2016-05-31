class Report < ActiveRecord::Base
  has_and_belongs_to_many :confirmed_issues

  enum category: [:pothole, :sidewalk, :streetlight, :traffic_signal, :signage,
                  :road_obstruction, :pavement, :powerline, :vandalism, :animal_control,
                  :other]
  enum status: [:active, :confirmed, :flagged, :deleted, :hidden]
  enum danger_level: [:mild, :moderate, :severe]
end
