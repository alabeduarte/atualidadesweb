require 'spec_helper'
describe News do

  context ".create" do
    it { News.create(url: "http://news.com", title: "News", subtitle: "...", image: "http://imgae.news.com", featured_leve: 0).should be_true }
  end

  describe ".build" do
    it "should looking for already news" do
      options = {
        url: "http://somenews.com",
        title: "somenews",
        subtitle: "news",
        image: "img.png",
        featured_leve: 0
      }
      News.stub(:where).with(options).and_return(News)
      News.should_receive(:where).with(url: options[:url])
      News.build_with options
    end
    it "should get first or create the news" do
      options = {
        url: "http://somenews.com",
        title: "somenews",
        subtitle: "news",
        image: "img.png",
        featured_leve: 0
      }
      News.should_receive(:first_or_create).with(options)
      News.build_with options
    end
    context "when already news on repository" do
      before { create(:news) }
      it "should not create a new record" do
        News.count.should == 1
        news_built = News.build_with(url: News.first.url)
        News.count.should == 1
      end
    end
    context "when news hasn't title or subtitle" do
      let(:options) do
        { url: "http://somenews.com" }
      end
      it { News.build_with(options).should be_nil }
    end
  end

  context ".breaking_news" do
    before { 150.times { create(:news) } }
    it "should fetch limited records" do
      News.should have(News::LIMIT).breaking_news
    end
    it "should fetch the most recent news sorted by last date" do
      News.breaking_news.each do |n|
        n.created_at.should_not == Time.utc(2013, 1, 1)
      end
    end
  end

  describe ".destroy_old_news" do
    context "when has many news" do
      before { 260.times { create(:news) } }
      it "should find and destroy the old news" do
        News.count.should == 260
        News.destroy_old_news
        News.count.should == 130
      end
    end
    context "when has few news" do
      before { 150.times {create(:news) } }
      it "should destroy the only remaining news" do
        News.count.should == 150
        News.destroy_old_news
        News.count.should == 130
      end
    end
    context "when has less news than limit" do
      before { 10.times {create(:news) } }
      it "should destroy the only remaining news" do
        News.count.should == 10
        News.destroy_old_news
        News.count.should == 10
      end
    end
  end
end
