class TimelineController < ApplicationController
  def index
    timeline = Timeline.new(NewsFeed, Newly)
    @news = timeline.all
    # @news = []
  end
end
