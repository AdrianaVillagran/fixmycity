class ConfirmedIssue < ActiveRecord::Base
  has_and_belongs_to_many :reports

  enum category: [:pothole, :sidewalk, :streetlight, :traffic_signal, :signage,
                  :sinkhole, :pavement, :powerline, :vandalism, :other]
  enum status: [:pending, :in_progress, :closed, :hidden]
  enum danger_level: [:mild, :moderate, :severe]
end
