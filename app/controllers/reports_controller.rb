class ReportsController < ApplicationController
  def index

    @report = Report.new
    @reports = Report.all
    @hash = Gmaps4rails.build_markers(@reports) do |report, marker|
      report_path = view_context.link_to "View Details", report_path(report), :"data-no-turbolink" => true
      marker.lat report.latitude
      marker.lng report.longitude
      marker.infowindow "<b>Report ##{report.id}</b><br>
                        #{report.title}<br>
                        Category: #{report.category}<br>
                        #{report.address}<br>
                        #{report_path}<br>"
    end
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

  # POST reports/confirm # creates a new confirmed issue
  def confirm
    @report = Report.find_by_id(params[:id])

    if !@report.confirmed?
      #changes status to confirmed
      @report.status = :confirmed

      #updates the report
      @report.confirmed!

      #store relevant attributes from report
      confirmed_issue_params = {
        title: @report.title,
        category: @report.category,
        danger_level: @report.danger_level,
        major_road: @report.major_road,
        cross_street1: @report.cross_street1,
        cross_street2: @report.cross_street2,
        latitude: @report.latitude,
        longitude: @report.longitude
        }

      #create a new confirmed issue record
      ci = @report.confirmed_issues.create(confirmed_issue_params)

      #redirect to edit confirmed issue form with ci data
      redirect_to edit_confirmed_issue_path(ci)
    end
  end

  private

  def report_params
    params.require(:report).permit(:title, :latitude, :longitude, :description,
                                   :category, :major_road, :address,
                                   :cross_street1, :cross_street2, :danger_level)
  end

end
