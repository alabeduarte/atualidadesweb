class TimelineController < ApplicationController
  respond_to :html, :json
  def index
    repository = FeedRepository.new('feeds.yml')
    timeline = Timeline.new(repository, NewsUpdater.new)
    @news = timeline.featured_news
    respond_with @news
  end
end
