class ReportsController < ApplicationController
  def index
  end

  def show
  end

 def create
    @report = Report.new(report_params)
    @report.user_id = current_user.id
 end

  def edit
  end

  def update
  end

  def destroy
  end
end
