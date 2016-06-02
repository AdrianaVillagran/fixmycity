class ConfirmedIssuesController < ApplicationController
  before_action :new_report
  before_action :set_confirmed_issue

  def index
    @confirmed_issues = ConfirmedIssue.all
    @hash = Gmaps4rails.build_markers(@confirmed_issues) do |issue, marker|
      issue_path = view_context.link_to issue.title, confirmed_issue_path(issue), :"data-no-turbolink" => true
      marker.lat issue.latitude
      marker.lng issue.longitude
      marker.infowindow "<b>#{issue_path}</b>"
    end
  end

  def show
  end

  def new
    @confirmed_issue = ConfirmedIssue.new
  end

  def edit
  end

  def update
    @confirmed_issue.update(confirmed_issue_params)
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
    # set report for report and issue button in navbar
    @report = Report.new
  end
end
