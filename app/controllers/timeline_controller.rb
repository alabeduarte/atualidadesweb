class TimelineController < ApplicationController
  respond_to :html
  def index
    timeline = Timeline.new
    @news = []#timeline.load(Feed, Reader)
    respond_with(@news)
  end
end
