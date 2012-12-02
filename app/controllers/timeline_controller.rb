class TimelineController < ApplicationController
  respond_to :html
  def index
    @timeline = Timeline.new(Feed, NewsUpdater.new)
    respond_with @timeline
  end
end
