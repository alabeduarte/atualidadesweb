class TimelineController < ApplicationController
  def index
    timeline = Timeline.new
    @news = timeline.all
  end
end
