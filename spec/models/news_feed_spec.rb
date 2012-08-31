require 'spec_helper'

describe NewsFeed do
  let(:news_feed) { news_feed = NewsFeed.new(
                    host: 'http://somenews.com',
                    selector: '#news',
                    url_pattern: 'a',
                    date_tag: '.date',
                    title: '.title',
                    subtitle: '.subtitle',
                    image_source: 'img',
                    date_tag: '.date') }
  it "should save news feed" do
    news_feed.save
    news_feed.should_not be_nil
  end

  context "a news feed required fields" do
    it "host should not be empty" do
      news_feed.host = nil
    end

    it "selector should not be empty" do
      news_feed.selector = nil
    end

    it "url pattern should not be empty" do
      news_feed.url_pattern = nil
    end

    it "title should not be empty" do
      news_feed.title = nil
    end

    it "subtitle should not be empty" do
      news_feed.subtitle = nil
    end

    after do
      news_feed.should_not be_valid
    end
  end

  context "a news feed optional fields" do
    it "image source should not be empty" do
      news_feed.image_source = nil
    end

    it "date tag should not be empty" do
      news_feed.date_tag = nil
    end

    after do
      news_feed.should be_valid
    end
  end

  context "news feed host" do
    it "when 'blabla' should not be valid" do
      news_feed.host = 'blabla'
      news_feed.should_not be_valid
    end
    it "when 'http://myhost.com' should be valid" do
      news_feed.host = 'http://myhost.com'
      news_feed.should be_valid
    end
    it "when 'http://www.myhost.com' should be valid" do
      news_feed.host = 'http://www.myhost.com'
      news_feed.should be_valid
    end
  end

end
