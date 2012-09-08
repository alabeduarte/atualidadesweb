require 'spec_helper'

describe Reader do
  let(:selector) { Nokogiri::HTML }
  let(:g1_feed) { Feed.new(
                          url: 'http://g1.globo.com',
                          selector: '#glb-corpo .glb-area .chamada-principal',
                          url_pattern: 'a',
                          title: '.chapeu',
                          subtitle: '.subtitulo',
                          image_source: '.foto a img') }
  let(:uol_feed) { Feed.new(
                          url: 'http://noticias.terra.com.br/ultimasnoticias/0,,EI188,00.html',
                          selector: 'div.geral section article.news',
                          url_pattern: 'h1 a',
                          title: 'h1 a span',
                          subtitle: 'p',
                          image_source: 'h1 a img',
                          date_tag: 'time') }
  let(:terra_feed) { Feed.new(
                          url: 'http://noticias.uol.com.br/noticias/',
                          selector: 'div.articles li',
                          url_pattern: 'a',
                          title: 'strong',
                          subtitle: '',
                          image_source: '',
                          date_tag: '') }
  let(:folha_feed) { Feed.new(
                          url: 'http://www1.folha.uol.com.br/emcimadahora/',
                          selector: '#newslist .nl2',
                          url_pattern: '.nlArticle a',
                          title: '.nlSection',
                          subtitle: '.nlArticle a',
                          image_source: '',
                          date_tag: '.nlHour') }
  let(:bbc_feed) { Feed.new(
                          url: 'http://www.bbc.co.uk/portuguese/ultimas_noticias/',
                          host: 'http://www.bbc.co.uk',
                          selector: '.content li.ts-headline',
                          url_pattern: 'a',
                          title: 'a',
                          subtitle: '.summary',
                          image_source: '',
                          date_tag: '.date') }
  let(:g1_reader) { build_reader_with(g1_feed.url, 'spec/html/g1.html') }
  let(:uol_reader) { build_reader_with(uol_feed.url, 'spec/html/uol.html') }
  let(:terra_reader) { build_reader_with(terra_feed.url, 'spec/html/terra.html') }
  let(:folha_reader) { build_reader_with(folha_feed.url, 'spec/html/folha.html') }
  let(:bbc_reader) { build_reader_with(bbc_feed.url, 'spec/html/bbc.html') }

  context "fetching news from http://g1.globo.com" do
    it "should fetch highlights news" do
      highlights = g1_feed.fetch(g1_reader)
      highlights.should_not be_empty
      highlights[0].url.should == 'http://g1.globo.com/mundo/noticia/2012/08/ira-encerra-resgate-apos-terremotos-e-revisa-mortos-para-227-diz-tv-estatal.html'
      highlights[0].subtitle.should == 'Tremores deixaram 1.380 pessoas feridas.'

      highlights[1].url.should == 'http://g1.globo.com/politica/mensalao/noticia/2012/08/historias-de-togas-e-becas-alimentam-folclore-de-tribunais-veja-algumas.html'
      highlights[1].title.should == 'julgamento no stf'

      highlights[2].url.should == 'http://g1.globo.com/concursos-e-emprego/noticia/2012/08/fazenda-e-9-orgaos-abrem-inscricoes-para-12-mil-vagas-na-segunda.html'
      highlights[2].title.should == 'a partir de amanha'
    end
  end

  context "fetching news from http://noticias.uol.com.br/noticias" do
    it "should fetch highlights news" do
      highlights = uol_feed.fetch(uol_reader)
      highlights.should_not be_empty
      highlights[0].date.should == '08/0918h32'
      highlights[0].url.should == 'http://esporte.uol.com.br/ultimas-noticias/reuters/2012/09/08/jackie-stewart-aconselha-hamilton-a-continuar-na-mclaren.htm'
      highlights[0].title.should == 'Jackie Stewart aconselha Hamilton a continuar na McLaren'
      highlights[0].subtitle.should == 'MONZA, 8 Set (Reuters) - Tricampeao de Formula 1, Jackie Stewart aconselhou Lewis Hamilton neste sabado a...'

      highlights[1].date.should == '08/0918h28'
      highlights[1].url.should == 'http://cinema.uol.com.br/ultnot/afp/2012/09/08/vencedor-do-festival-de-veneza-diz-que-seu-flime-e-metafora-do-capitalismo-extremo.jhtm'
      highlights[1].image.should == 'http://imguol.com/2012/09/08/diretor-sul-coreano-kim-ki-duk-exibe-o-leao-de-ouro-conquistado-no-festival-de-veneza-pelo-filme-pieta-8912-1347132275894_142x100.jpg'
      highlights[1].title.should == 'Vencedor do Festival de Veneza diz que seu flime e "metafora do capitalismo extremo"'
      highlights[1].subtitle.should == 'O cinema de autor, poetico e cruel, triunfou este sabado (8) na 69 Mostra de Veneza, com o Leao de Ouro sendo dado ao...'
    end
  end

  context "fetching news from http://noticias.terra.com.br" do
    it "should fetch highlights news" do
      highlights = terra_feed.fetch(terra_reader)
      highlights.should_not be_empty
      highlights[0].url.should == 'http://noticias.terra.com.br/eleicoes/2012/rj/rio-de-janeiro/noticias/0,,OI6133651-EI20647,00-Maia+descarta+rejeicao+tenho+que+crescer+onde+tenho+chances.html'
      highlights[0].title.should == 'Maia descarta rejeicao: "tenho que crescer onde tenho chances"'

      highlights[1].url.should == 'http://noticias.terra.com.br/mundo/noticias/0,,OI6133649-EI294,00-Ataque+aereo+mata+guerrilheiros+das+Farc+na+Colombia.html'
      highlights[1].title.should == 'Ataque aereo mata 3 guerrilheiros das Farc na Colombia'

      highlights[2].url.should == 'http://noticias.terra.com.br/mundo/noticias/0,,OI6133652-EI294,00-Pesquisa+revela+utilidade+de+do+DNA+que+era+visto+como+lixo.html'
      highlights[2].title.should == 'Pesquisa revela utilidade de 99% do DNA que era visto como "lixo"'
    end
  end

  context "fetching news from http://www1.folha.uol.com.br/emcimadahora/" do
    it "should fetch highlights news" do
      highlights = folha_feed.fetch(folha_reader)
      highlights.should_not be_empty
      highlights[0].date.should == '18h56'
      highlights[0].url.should == 'http://www1.folha.uol.com.br/mundo/1150652-al-qaeda-reivindica-131-ataques-no-iraque-durante-o-ramada.shtml'
      highlights[0].title.should == 'Mundo'
      highlights[0].subtitle.should == 'Al Qaeda reivindica 131 ataques no Iraque durante o Ramada'
    end
  end

  context "fetching news from http://www.bbc.co.uk/portuguese/ultimas_noticias/" do
    it "should fetch highlights news" do
      highlights = bbc_feed.fetch(bbc_reader)
      highlights.should_not be_empty
      highlights[0].date.should == '8 setembro, 2012'
      highlights[0].url.should == 'http://www.bbc.co.uk/portuguese/ultimas_noticias/2012/09/120908_aberto_tenis_mau_tempo_lgb.shtml'
      highlights[0].title.should == 'Mau tempo adia final feminina do Aberto de Tenis dos Estados Unidos'
      highlights[0].subtitle.should == 'A americana Serena Williams e a bielorrussa Victoria Azarenka se enfrentarao no domingo (9).'
    end
  end
private
  def build_reader_with(host, html)
    Reader.new(host, parse(html))
  end
  def parse(path)
    selector.parse(File.read(path))
  end
end
