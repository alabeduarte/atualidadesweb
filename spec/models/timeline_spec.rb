require 'spec_helper'

describe Timeline do

  before(:each) { Rails.cache.clear }

  let(:updater) { mock(:news_updater) }
  let(:repository) { FeedRepository.new './spec/fake_feeds.yml' }

  subject { Timeline.new(repository, updater) }
  context "when fetching featured news" do
    context "breaking news from repository" do
      it "should get news from cache first" do
        Cache.should_receive(:fetch).with(key: 'breaking_news')

        subject.featured_news
      end
      it "should get news from repository then" do
        News.should_receive(:breaking_news)

        subject.featured_news
      end
    end
    it "should update all feeds" do
      updater.should_receive(:update_by).with(repository.all)

      subject.featured_news
    end
  end

end
