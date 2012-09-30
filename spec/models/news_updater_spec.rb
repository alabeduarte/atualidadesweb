require 'spec_helper'

describe NewsUpdater do
  before(:each) do
    Rails.cache.clear
  end

  context "fetching news" do
    let(:feed) { mock(:feed) }
    before do
      news = []
      10.times {|n| news << mock(:news)}
      feed.stub(:news).and_return(news)
    end
    it "should fetch news from your url" do
      updater = NewsUpdater.new
      updater.update_by('feed', [feed]).size.should == 10
    end
  end

end
