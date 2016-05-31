class ConfirmedIssuesController < ApplicationController
  before_action :set_report

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

  def set_report
    # set report for report and issue button in navbar
    @report = Report.new
  end
end
