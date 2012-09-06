class TimelineController < ApplicationController
  def index
    timeline = Timeline.new(Feed)
    @news = timeline.all(Newly)
    # @news = []
  end
end
