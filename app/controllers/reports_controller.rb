class ReportsController < ApplicationController
  def index
    @reports = Report.all
    @report = Report.new
  end

  def create
    @report = Report.new(report_params)
    if @report.save
      redirect_to report_path(@report)
    end
  end

  def show
    @report = Report.find_by_id(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end


  def confirm
    @report = Report.find_by_id(params[:id])

    #changes status to confirmed
    @report.status = :confirmed

    #updates the report
    @report.confirmed!
    redirect_to report_path(@report)
  end

  private

  def report_params
    params.require(:report).permit(:title, :description, :category, :major_road,
                                   :cross_street1, :cross_street2)
  end

end
