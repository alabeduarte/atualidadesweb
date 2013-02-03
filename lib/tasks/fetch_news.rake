desc "Fetching news"
task :fetch_news => :environment do
  workers = []
  feeds = Feed.all
  feeds.each do |feed|
    workers << Thread.new do
      NewsCrawler.new(feed).fetch
    end
  end
  workers.each(&:join)
  puts "Success!"
end
