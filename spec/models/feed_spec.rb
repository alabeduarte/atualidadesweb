require 'spec_helper'

describe Feed do
  let(:feed) { Feed.new(
                                  url: 'http://somenews.com',
                                  selector: '#news',
                                  url_pattern: 'a',
                                  title: '.title',
                                  subtitle: '.subtitle',
                                  image_source: 'img',
                                  host: 'http://somenews.com',
                                  date_tag: '.date') }
  it "should save news feed" do
    feed.save
    feed.should_not be_nil
  end

  context "a news feed required fields" do
    it "url should not be empty" do
      feed.url = nil
    end

    it "host should not be empty" do
      feed.host = nil
    end

    it "selector should not be empty" do
      feed.selector = nil
    end

    it "url pattern should not be empty" do
      feed.url_pattern = nil
    end

    it "title should not be empty" do
      feed.title = nil
    end

    after do
      feed.should_not be_valid
    end
  end

  context "a news feed optional fields" do
    it "subtitle maybe empty" do
      feed.subtitle = nil
    end

    it "image source maybe empty" do
      feed.image_source = nil
    end

    it "date tag maybe empty" do
      feed.date_tag = nil
    end

    after do
      feed.should be_valid
    end
  end

  context "news feed url" do
    it "when 'blabla' should not be valid" do
      feed.url = 'blabla'
      feed.should_not be_valid
    end
    it "when 'http://myhost
.com' should be valid" do
      feed.url = 'http://myhost.com'
      feed.should be_valid
    end
    it "when 'http://www.myhost.com' should be valid" do
      feed.url = 'http://www.myhost.com'
      feed.should be_valid
    end
  end

  context "fecthing news" do
    let(:reader) { mock(:newly) }
    before do
      news = []
      10.times {|n| news << mock(:news)}
      reader.stub(:highlights).with(anything).and_return(news)
    end
    it "should fetch news from your url" do
      reader.should_receive(:highlights).with(anything)
      feed.fetch(reader).size.should == 10
    end
  end

end
