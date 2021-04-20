class ReportCommentsController < ApplicationController
  def create
    report = Report.find(params[:report_id])
    comment = current_user.report_comments.new(report_comment_params)
    comment.report_id = report.id
    comment.save
    redirect_to report_path(report)
  end

  def destroy
   ReportComment.find_by(id: params[:id], report_id: params[:report_id]).destroy
    redirect_to report_path(params[:report_id])
  end

  private

  def report_comment_params
    params.require(:report_comment).permit(:comment)
  end
end
