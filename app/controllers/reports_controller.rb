class ReportsController < ApplicationController
  before_action :authorize, only: [:edit, :update, :confirm]

  def index

    @report = Report.new
    @reports = Report.all
    @hash = Gmaps4rails.build_markers(@reports) do |report, marker|
      if !report.hidden?
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
  end

  def create
    @report = Report.new(report_params)
    if @report.save
      redirect_to report_path(@report)
    end
  end

  def show
    @report = Report.find_by_id(params[:id])
    if !@report.hidden?
      return map_related_reports(@report)
    else
      if !current_user || !current_user.admin?
        flash[:alert] = "That report has been removed."
        return redirect_to reports_path
      elsif current_user.admin?
        map_related_reports(@report)
      end
    end
  end

  def edit
    @report = Report.find_by_id(params[:id])
  end

  def update
    @report = Report.find_by_id(params[:id])
    if @report.update(report_params)
      flash[:notice] = "Report has been successfully updated"
      redirect_to report_path(@report)
    else
      flash[:error] = @report.errors.full_messages.join(", ")
      redirect_to edit_report_path(@report)
    end
  end

  def map_related_reports(report)
    distance = 0.1
    center_point = [report.latitude, report.longitude]
    box = Geocoder::Calculations.bounding_box(center_point, distance)
    @related_reports = Report.within_bounding_box(box)

    @hash = Gmaps4rails.build_markers(@related_reports) do |report, marker|
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

  # POST reports/:id/confirm # creates a new confirmed issue
  def confirm
    @report = Report.find_by_id(params[:id])


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
      return redirect_to edit_confirmed_issue_path(ci)

  end

  def hide
    @report = Report.find_by_id(params[:id])

    @report.status = :hidden
    @report.hidden!

    redirect_to reports_path
  end

  private

  def report_params
    params.require(:report).permit(:title, :latitude, :longitude, :description,
                                   :category, :major_road, :address, :status,
                                   :cross_street1, :cross_street2, :danger_level)
  end

end
