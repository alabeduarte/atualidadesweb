class TimelineController < ApplicationController
  def index
    timeline = Timeline.new(Feed, Newly)
    @news = timeline.all
    # @news = []
  end
end
