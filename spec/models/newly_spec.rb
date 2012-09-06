require 'spec_helper'

describe Newly do
  let(:selector) { Nokogiri::HTML }
  let(:g1) { build_reader_with('http://g1.globo.com', 'spec/html/g1.html') }
  let(:metro1) { build_reader_with('http://www.metro1.com.br/portal/?varSession=noticia&varEditoria=cidade', 'spec/html/metro1_cidade.html') }
  let(:terra) { build_reader_with('http://noticias.terra.com.br/ultimasnoticias/0,,EI188,00.html', 'spec/html/terra.html') }

  context "fetching news from http://g1.globo.com" do
    it "should fetch highlights news" do
      feed = Feed.new(
                      url: g1.url,
                      selector: '#glb-corpo .glb-area .chamada-principal',
                      url_pattern: 'a',
                      title: '.chapeu',
                      subtitle: '.subtitulo',
                      image_source: '.foto a img')

      highlights = feed.fetch(g1)
      highlights.should_not be_empty
      highlights[0].url.should == 'http://g1.globo.com/mundo/noticia/2012/08/ira-encerra-resgate-apos-terremotos-e-revisa-mortos-para-227-diz-tv-estatal.html'
      highlights[0].subtitle.should == 'Tremores deixaram 1.380 pessoas feridas.'

      highlights[1].url.should == 'http://g1.globo.com/politica/mensalao/noticia/2012/08/historias-de-togas-e-becas-alimentam-folclore-de-tribunais-veja-algumas.html'
      highlights[1].title.should == 'julgamento no stf'

      highlights[2].url.should == 'http://g1.globo.com/concursos-e-emprego/noticia/2012/08/fazenda-e-9-orgaos-abrem-inscricoes-para-12-mil-vagas-na-segunda.html'
      highlights[2].title.should == 'a partir de amanha'
    end
  end

  it "should fetch highlights from http://www.metro1.com.br" do
    feed = Feed.new(
                    url: metro1.url,
                    host: 'http://www.metro1.com.br',
                    selector: '#lista-de-resultados .resultado',
                    url_pattern: 'a',
                    title: '.resultado-titulo',
                    subtitle: '.resultado-texto',
                    image_source: 'a img.img-resultado',
                    date_tag: '.resultado-data')

    highlights = feed.fetch(metro1)
    highlights.should_not be_empty
  end

  context "fetching news from http://noticias.terra.com.br" do
    it "should fetch highlights news" do
      feed = Feed.new(
                      url: terra.url,
                      selector: 'div.articles li',
                      url_pattern: 'a',
                      title: 'strong',
                      subtitle: '',
                      image_source: '',
                      date_tag: '')

      highlights = feed.fetch(terra)
      highlights.should_not be_empty
      highlights[0].url.should == 'http://noticias.terra.com.br/eleicoes/2012/rj/rio-de-janeiro/noticias/0,,OI6133651-EI20647,00-Maia+descarta+rejeicao+tenho+que+crescer+onde+tenho+chances.html'
      highlights[0].title.should == 'Maia descarta rejeicao: "tenho que crescer onde tenho chances"'

      highlights[1].url.should == 'http://noticias.terra.com.br/mundo/noticias/0,,OI6133649-EI294,00-Ataque+aereo+mata+guerrilheiros+das+Farc+na+Colombia.html'
      highlights[1].title.should == 'Ataque aereo mata 3 guerrilheiros das Farc na Colombia'

      highlights[2].url.should == 'http://noticias.terra.com.br/mundo/noticias/0,,OI6133652-EI294,00-Pesquisa+revela+utilidade+de+do+DNA+que+era+visto+como+lixo.html'
      highlights[2].title.should == 'Pesquisa revela utilidade de 99% do DNA que era visto como "lixo"'
    end
  end
private
  def build_reader_with(host, html)
    Newly.new(host, parse(html))
  end
  def parse(path)
    selector.parse(File.read(path))
  end
end
