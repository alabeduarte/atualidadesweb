require 'spec_helper'

describe NewsCrawler do
  let(:selector) { Nokogiri::HTML }
  let(:globo_feed) { Factory(:globo_feed) }
  let(:g1_feed) { Factory(:g1_feed) }
  let(:uol_feed) { Factory(:uol_feed) }
  let(:terra_feed) { Factory(:terra_feed) }
  let(:folha_feed) { Factory(:folha_feed) }

  let(:globo_reader) { build_reader_with(globo_feed, 'spec/html/globo.html') }
  let(:g1_reader) { build_reader_with(g1_feed, 'spec/html/g1.html') }
  let(:uol_reader) { build_reader_with(uol_feed, 'spec/html/uol.html') }
  let(:terra_reader) { build_reader_with(terra_feed, 'spec/html/terra.html') }
  let(:folha_reader) { build_reader_with(folha_feed, 'spec/html/folha.html') }

  before(:each) do
    Rails.cache.clear
  end

  describe "when crawling news" do
    it "should store all news fetched" do
      News.should_receive(:create).with(anything).at_least :once
      fetch globo_reader, globo_feed
    end
  end

  describe "validating 'http://www.globo.com' selector" do
    it "should fetch high quality images" do
      news = fetch(globo_reader, globo_feed)
      news[0].image.should == "http://s.glbimg.com/en/ho/f/original/2012/09/29/exobeso.jpg"
    end
  end

  describe "validating 'http://g1.globo.com' selector" do
    let(:news) { fetch(g1_reader, g1_feed) }
    it { news.should_not be_empty }
    it { news[0].url.should == 'http://g1.globo.com/mundo/noticia/2012/08/ira-encerra-resgate-apos-terremotos-e-revisa-mortos-para-227-diz-tv-estatal.html' }
    it { news[0].subtitle.should == 'Tremores deixaram 1.380 pessoas feridas.' }
    it { news[0].feed.url == "http://g1.globo.com/" }
  end

  describe "validating 'http://noticias.uol.com.br/noticias' selector" do
    let(:news) { fetch(uol_reader, uol_feed) }
    it { news.should_not be_empty }
    it { news[0].url.should == 'http://esporte.uol.com.br/ultimas-noticias/reuters/2012/09/08/jackie-stewart-aconselha-hamilton-a-continuar-na-mclaren.htm' }
    it { news[0].title.should == 'Jackie Stewart aconselha Hamilton a continuar na McLaren' }
    it { news[0].subtitle.should == 'MONZA, 8 Set (Reuters) - Tricampeao de Formula 1, Jackie Stewart aconselhou Lewis Hamilton neste sabado a...' }
    it { news[0].feed.url == "http://noticias.uol.com.br/noticias" }
  end

  describe "validating 'http://noticias.uol.com.br/noticias' selector" do
    let(:news) { fetch(terra_reader, terra_feed) }
    it { news.should_not be_empty }
    it { news[0].url.should == 'http://noticias.terra.com.br/eleicoes/2012/rj/rio-de-janeiro/noticias/0,,OI6133651-EI20647,00-Maia+descarta+rejeicao+tenho+que+crescer+onde+tenho+chances.html' }
    it { news[0].title.should == 'Maia descarta rejeicao: "tenho que crescer onde tenho chances"' }
  end

  describe "validating 'http://www1.folha.uol.com.br/emcimadahora/' selector" do
    let(:news) { fetch(folha_reader, folha_feed) }
    it { news.should_not be_empty }
    it { news[0].url.should == 'http://www1.folha.uol.com.br/mundo/1150652-al-qaeda-reivindica-131-ataques-no-iraque-durante-o-ramada.shtml' }
    it { news[0].title.should == 'Mundo' }
    it { news[0].subtitle.should == 'Al Qaeda reivindica 131 ataques no Iraque durante o Ramada' }
  end


  it "should fetch news with limit" do
    limit_news = 1
    feed = Feed.new(url: 'http://g1.globo.com',
                    selector: '#glb-corpo .glb-area .chamada-principal',
                    limit: limit_news)
    reader = build_reader_with(feed, 'spec/html/g1.html')
    news = fetch(reader, feed)
    news.size.should be limit_news
  end

private
  def fetch(reader, feed)
    reader.news
  end

  def build_reader_with(feed, html)
    NewsCrawler.new(feed, parse(html))
  end
  def parse(path)
    selector.parse(File.read(path))
  end
end
