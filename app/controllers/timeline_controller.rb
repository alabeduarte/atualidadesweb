class TimelineController < ApplicationController
  def index
    timeline = Timeline.new
    @news = timeline.list
  end
end
