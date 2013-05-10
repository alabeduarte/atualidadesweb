class TimelineController < ApplicationController
  respond_to :html, :json
  def index
    timeline = Timeline.new(Feed, NewsUpdater.new)
    @news = timeline.featured_news
    respond_with @news
  end
end
