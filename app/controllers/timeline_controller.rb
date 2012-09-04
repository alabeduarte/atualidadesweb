class TimelineController < ApplicationController
  def index
    timeline = Timeline.new
    @news = timeline.all
    # @news = []
  end
end
