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
                        date_tag: '.date',
                        featured_level: 0,
                        limit: 5) }
  it "should save news feed" do
    feed.save
    feed.should_not be_nil
  end

  context "validations" do
    context "url" do
      it "when 'blabla' should not be valid" do
        feed.url = 'blabla'
        feed.should_not be_valid
      end
      it "when 'http://myhost.com' should be valid" do
        feed.url = 'http://myhost.com'
        feed.should be_valid
      end
      it "when 'http://www.myhost.com' should be valid" do
        feed.url = 'http://www.myhost.com'
        feed.should be_valid
      end
    end
    context "featured level" do
      it "when non numeric value should not be valid" do
        feed.featured_level = 'teste'
        feed.should_not be_valid
      end
      it "when numeric value should be valid" do
        feed.featured_level = 0
        feed.should be_valid
      end
    end
    context "limit" do
      it "when non numeric value should not be valid" do
        feed.limit = 'teste'
        feed.should_not be_valid
      end
      it "when numeric value should be valid" do
        feed.limit = 10
        feed.should be_valid
      end
    end
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
    it "when 'http://myhost.com' should be valid" do
      feed.url = 'http://myhost.com'
      feed.should be_valid
    end
    it "when 'http://www.myhost.com' should be valid" do
      feed.url = 'http://www.myhost.com'
      feed.should be_valid
    end
  end

  context "fecthing news" do
    let(:reader) { mock(:reader) }
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

  context "featured level" do
    before do
      Feed.create(
                url: 'http://somenews.com/1',
                selector: '#news',
                url_pattern: 'a',
                title: '.title',
                subtitle: '.subtitle',
                image_source: 'img',
                host: 'http://somenews.com/1',
                featured_level: 0,
                limit: 5,
                date_tag: '.date')
      Feed.create(
                url: 'http://somenews.com/2',
                selector: '#news',
                url_pattern: 'a',
                title: '.title',
                subtitle: '.subtitle',
                image_source: 'img',
                host: 'http://somenews.com/2',
                featured_level: 1,
                limit: 5,
                date_tag: '.date')
      Feed.create(
                url: 'http://somenews.com/3',
                selector: '#news',
                url_pattern: 'a',
                title: '.title',
                subtitle: '.subtitle',
                image_source: 'img',
                host: 'http://somenews.com/3',
                featured_level: 2,
                limit: 5,
                date_tag: '.date')
    end

    it "should find all feeds by featured level" do
      feeds = Feed.all(featured_level: 1)
      feeds[0].url.should == 'http://somenews.com/2'
    end
  end

end
