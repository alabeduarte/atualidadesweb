require 'spec_helper'

describe WebReader do
  let(:ec_bahia) { ec_bahia = WebReader.new('http://www.ecbahia.com') }
  let(:g1) { g1_bahia = WebReader.new('http://g1.globo.com') }
  let(:g1_bahia) { g1_bahia = WebReader.new('http://g1.globo.com/bahia/') }
  let(:metro1) { g1_bahia = WebReader.new('http://www.metro1.com.br/portal/?varSession=noticia&varEditoria=cidade') }
  
  it "should fetch ecbahia title" do
    ec_bahia.title.should == "ecbahia.com - \u00e9 goleada tricolor na internet!  (ecbahia, ecbahia.com, ecbahia.com.br, Esporte Clube Bahia)"
  end
  
  it "should fetch highlights from http://g1.globo.com/bahia" do
    highlights = g1_bahia.highlights( css: '#ultimas-regiao div, #ultimas-regiao ul li',
                                      url: 'a',
                                      date: '.data-hora',
                                      title: '.titulo',
                                      subtitle: '.subtitulo',
                                      image: 'img'
                                      )
    highlights.should_not be_empty
  end
  
  it "should fetch secondary news from http://g1.globo.com" do
    highlights = g1.highlights( css: '#glb-corpo .glb-area .chamada-principal',
                                      url: 'a',
                                      title: '.chapeu',
                                      subtitle: '.subtitulo',
                                      image: '.foto a img'
                                      )
    highlights.should_not be_empty
  end
  
  it "should fetch highlights from http://www.metro1.com.br" do
    highlights = metro1.highlights( css: '#lista-de-resultados .resultado',
                                      url: 'a',
                                      date: '.resultado-data',
                                      title: '.resultado-titulo',
                                      subtitle: '.resultado-texto',
                                      image: 'a img.img-resultado',
                                      host: 'http://www.metro1.com.br'
                                      )
    highlights.should_not be_empty
  end
end
