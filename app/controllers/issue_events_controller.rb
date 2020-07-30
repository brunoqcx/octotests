class IssueEventsController < ApplicationController
  def index
    render json: { 
      data: collection
   }, status: :ok
  end

  private

  def collection
    @collection ||= IssueEvent.by_issue_number(params[:issue_number])
                              .page(params[:page] || 1)
                              .per(params[:per_page] || Kaminari.config.default_per_page)
  end
end
