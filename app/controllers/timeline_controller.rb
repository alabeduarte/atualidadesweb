class TimelineController < ApplicationController
  respond_to :html
  def index
    @timeline = Timeline.new(Feed, Reader)
    respond_with(@timeline)
  end
end
