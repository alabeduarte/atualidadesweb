class WelcomeController < ApplicationController
  def index
  end
  
  def g1_news
    reader=WebReader.new('http://g1.globo.com')
    @news = reader.highlights( css: '#glb-corpo .glb-area .chamada-principal',
                        url: 'a',
                        title: '.chapeu',
                        subtitle: 'a',
                        image: '.foto a img'
                        )
    respond_to do |format|
      format.html
      format.json  { render :json => @news.as_json }
    end
  end
  
  def g1_bahia_news
    reader=WebReader.new('http://g1.globo.com/bahia/')
    @news = reader.highlights( css: '#ultimas-regiao div, #ultimas-regiao ul li',
                               url: 'a',
                               date: '.data-hora',
                               title: '.titulo',
                               subtitle: '.subtitulo',
                               image: 'img'
                              )
    respond_to do |format|
      format.html
      format.json  { render :json => @news.as_json }
    end
  end
  
  def atarde_news
    reader=WebReader.new('http://atarde.uol.com.br/ultimas-noticias/')
    @news = reader.highlights( css: '#listagemUltimas ul li .colNot .box_colNot',
                               url: 'a',
                               date: '.hora-comment',
                               title: '.hoverNot',
                               subtitle: '.resumoNoticia',
                               image: 'img',
                               host: 'http://atarde.uol.com.br'
                              )
    respond_to do |format|
      format.html
      format.json  { render :json => @news.as_json }
    end
  end
  
  def metro1_news
    reader=WebReader.new('http://www.metro1.com.br/portal/?varSession=noticia&varEditoria=cidade')
    @news = reader.highlights( css: '#lista-de-resultados .resultado',
                                url: 'a',
                                date: '.resultado-data',
                                title: '.resultado-titulo',
                                subtitle: '.resultado-texto',
                                image: 'a img.img-resultado',
                                host: 'http://www.metro1.com.br'
                                )
    respond_to do |format|
      format.html
      format.json  { render :json => @news.as_json }
    end
  end
  
end
