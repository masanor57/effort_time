class ReportsController < ApplicationController

  def index
    @user = current_user
    @reports = Report.all
    @report = Report.new
    @report_sum = @user.reports.sum(:time)
  end

  def show
    @report = Report.find(params[:id])
    @report_comment = ReportComment.new
  end

 def create
    @report = Report.new(report_params)
    @report.user_id = current_user.id
    @report.score = Language.get_data(report_params[:body])

  if @report.save
      redirect_to reports_path(@report), notice: "You have created report successfully."
  else
      @reports = Report.all
      render 'index'
  end
 end

  def edit
    @report = Report.find(params[:id])
    if @report.user == current_user
        render "edit"
    else
        redirect_to reports_path
    end
  end

  def update
    @report = Report.find(params[:id])
    @report.user_id = current_user.id
    if @report.update(report_params)
      redirect_to report_path(@report), notice: "You have updated book successfully."
    else
      render "edit"
    end
  end

  def destroy
    @report = Report.find(params[:id])
    @report.destroy
    redirect_to reports_path
  end

  private

  def report_params
    params.require(:report).permit(:time, :body, :date)
  end

end
