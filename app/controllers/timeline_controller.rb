class TimelineController < ApplicationController
  respond_to :html
  def index
    timeline = Timeline.new(Feed)
    @news = timeline.all_cached(Reader)
    respond_with(@news)
  end
end
