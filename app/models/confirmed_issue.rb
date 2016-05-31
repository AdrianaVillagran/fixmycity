class ConfirmedIssue < ActiveRecord::Base
  enum category: [:pothole, :sidewalk, :streetlight, :traffic_signal, :signage,
                  :sinkhole, :pavement, :powerline, :vandalism, :other]
  enum status: [:pending, :in_progress, :closed, :hidden]
  enum danger_level: [:mild, :moderate, :severe]
end
