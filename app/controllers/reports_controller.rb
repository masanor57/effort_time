class ReportsController < ApplicationController

  def index
    @user = current_user
    @reports = Report.all
    @report = Report.new
  end

  def show
    @report = Report.find(params[:id])
    @report_comment = ReportComment.new
  end

 def create
    @report = Report.new(report_params)
    @report.user_id = current_user.id
  if @report.save
      redirect_to reports_path(@report), notice: "You have created book successfully."
  else
      @reports = Report.all
      render 'index'
  end
 end

  def update
  end

  def destroy
    @report = Report.find(params[:id])
    @report.destroy
    redirect_to report_path
  end

  private

  def report_params
    params.require(:report).permit(:title, :body)
  end

end
