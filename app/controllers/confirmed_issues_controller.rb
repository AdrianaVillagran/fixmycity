class ConfirmedIssuesController < ApplicationController
  before_action :new_report
  before_action :authorize, only: [:edit, :update]
  before_action :set_confirmed_issue

  def index
    @confirmed_issue = ConfirmedIssue.new
    @confirmed_issues = ConfirmedIssue.all

    @hash = Gmaps4rails.build_markers(@confirmed_issues) do |issue, marker|
      issue_path = view_context.link_to "View Details", confirmed_issue_path(issue), :"data-no-turbolink" => true
      marker.lat issue.latitude
      marker.lng issue.longitude
      marker.infowindow "<b>Issue ##{issue.id}</b><br>
                        #{issue.title}<br>
                        Category: #{issue.category}<br>
                        #{issue_path}<br>"
    end
  end

  def show

  end

  def new
    @confirmed_issue = ConfirmedIssue.new
  end

  def edit
    reports = Report.all
    @unconfirmed_reports = []
    reports.each do |report|
      if !report.confirmed?
        @unconfirmed_reports << report
      end
    end

  end

  def update
    @confirmed_issue.update(confirmed_issue_params)

    # filter through reports id array in params
    params[:confirmed_issue][:id].each do |id|
      if !id.blank?
        # find reports by id's in array
        report = Report.find(id.to_i)

        # push reports into confirmed_issue
        # hacky but it works :/
        @confirmed_issue.reports << report

        # updates each report status to confirmed
        @confirmed_issue.reports.each do |report|
          report.status = :confirmed
          report.confirmed!
        end
      end
    end

    redirect_to confirmed_issue_path
  end

  private

  def confirmed_issue_params
    params.require(:confirmed_issue)
          .permit(:title, :latitude, :longitude,
                  :category, :major_road,
                  :cross_street1, :cross_street2,
                  :danger_level, :status, :notes)
  end

  def set_confirmed_issue
    @confirmed_issue = ConfirmedIssue.find_by_id(params[:id])
  end

  def new_report
    # set report for report an issue button
    @report = Report.new
  end
end
