class ReportsController < ApplicationController

  def index
    @user = current_user
    @reports = Report.all
    @report = Report.new
  end

  def show
    @report = Report.find(params[:id])
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
  end

  private

  def report_params
    params.require(:report).permit(:title, :body)
  end

end
