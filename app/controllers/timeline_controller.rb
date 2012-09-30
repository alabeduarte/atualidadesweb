class TimelineController < ApplicationController
  respond_to :html
  def index
    @timeline = Timeline.new(Feed)
    respond_with(@timeline)
  end
end
