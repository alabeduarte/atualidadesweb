require 'spec_helper'

describe NewsUpdater do
  before(:each) { Rails.cache.clear }

  describe "#update_by" do
    let(:feed) do
      repository = FeedRepository.new('./spec/fake_feeds.yml').all

      repository.first
    end

    it "should verify cache before update" do
      Cache.should_receive(:fetch).with(key: 'featured')

      subject.update_by([feed, feed, feed])
    end
    it "should clean up the each one old news" do
      News.should_receive(:destroy_old_news).exactly(1).times

      subject.update_by([feed, feed, feed])
    end
    it "should call the crawler for each feed" do
      Newly::NewsCrawler.should_receive(:new).with(anything).exactly(3).times

      subject.update_by([feed, feed, feed])
    end
  end
end
