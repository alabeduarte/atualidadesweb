class TimelineController < ApplicationController
  def index
    timeline = Timeline.new(Feed)
    @news = timeline.all_cached(Reader)
  end
end
