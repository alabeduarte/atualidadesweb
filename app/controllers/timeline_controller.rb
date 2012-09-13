class TimelineController < ApplicationController
  respond_to :html
  def index
    timeline = Timeline.new(Feed)
    @news = timeline.load(Reader)
    respond_with(@news)
  end
end
