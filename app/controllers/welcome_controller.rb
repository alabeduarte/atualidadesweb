class WelcomeController < ApplicationController
  def index
  end

  def g1_news
    reader=Reader.new('http://g1.globo.com')
    @news = reader.highlights( selector: '#glb-corpo .glb-area .chamada-principal',
                        url: 'a',
                        title: '.chapeu',
                        subtitle: 'a',
                        img: '.foto a img'
                        )
    respond_to do |format|
      format.html
      format.json  { render :json => @news.as_json }
    end
  end

  def g1_bahia_news
    reader=Reader.new('http://noticias.uol.com.br/noticias/')
    @news = reader.highlights( selector: 'div.geral section article.news',
                               href: 'h1 a',
                               date: 'time',
                               title: 'h1 a span',
                               subtitle: 'p',
                               img: 'h1 a img'
                              )
    respond_to do |format|
      format.html
      format.json  { render :json => @news.as_json }
    end
  end

  def atarde_news
    reader=Reader.new('http://www1.folha.uol.com.br/emcimadahora/')
    @news = reader.highlights( selector: '#newslist .nl2',
                               href: '.nlArticle a',
                               date: '.nlHour',
                               title: '.nlSection',
                               subtitle: '.nlArticle a',
                               host: 'http://www1.folha.uol.com.br/emcimadahora/'
                              )
    respond_to do |format|
      format.html
      format.json  { render :json => @news.as_json }
    end
  end

  def metro1_news
    reader=Reader.new('http://www.metro1.com.br/portal/?varSession=noticia&varEditoria=cidade')
    @news = reader.highlights( selector: '#lista-de-resultados .resultado',
                                href: 'a',
                                date: '.resultado-data',
                                title: '.resultado-titulo',
                                subtitle: '.resultado-texto',
                                img: 'a img.img-resultado',
                                host: 'http://www.metro1.com.br'
                                )
    respond_to do |format|
      format.html
      format.json  { render :json => @news.as_json }
    end
  end

end
