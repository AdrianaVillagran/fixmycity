class ConfirmedIssuesController < ApplicationController
  before_action :set_report
  before_action :set_confirmed_issue

  def index
    @confirmed_issues = ConfirmedIssue.all
  end

  def show
  end

  def new
  end

  def edit
  end

  private

  def set_confirmed_issue
    @confirmed_issue = ConfirmedIssue.find_by_id(params[:id])
  end

  def set_report
    # set report for report and issue button in navbar
    @report = Report.new
  end
end
