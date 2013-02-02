FactoryGirl.define do

  factory :feed do
    sequence(:url) {|n| "http://somenews.com/#{n}" }
    sequence(:host) {|n| "http://somenews.com/#{n}" }
    featured_level 0
    selector "#news"
    url_pattern "a"
    title ".title"
    limit 5
  end

  factory :globo_feed, :class => Feed do
    url "http://www.globo.com/"
    host "http://www.globo.com/"
    featured_level 0
    selector ".glb-area-colunas .area .chamada-principal"
    url_pattern "a"
    title ".conteudo p"
    image_source "img"
    limit 3
  end

  factory :g1_feed, :class => Feed do
    url "http://g1.globo.com"
    host "http://g1.globo.com"
    featured_level 0
    selector "#glb-corpo .glb-area .chamada-principal"
    url_pattern "a"
    title ".chapeu"
    subtitle ".subtitulo"
    image_source ".foto a img"
    limit 3
  end

  factory :uol_feed, :class => Feed do
    url "http://noticias.uol.com.br/noticias/"
    host "http://noticias.uol.com.br/noticias/"
    featured_level 0
    selector "div.geral section article.news"
    url_pattern "h1 a"
    title "h1 a span"
    subtitle "p"
    image_source "h1 a img"
    limit 3
  end

  factory :terra_feed, :class => Feed do
    url "http://noticias.terra.com.br/ultimasnoticias/0,,EI188,00.html"
    host "http://noticias.terra.com.br/ultimasnoticias/0,,EI188,00.html"
    featured_level 0
    selector "div.articles li"
    url_pattern "a"
    title "strong"
    limit 3
  end

  factory :folha_feed, :class => Feed do
    url "http://www1.folha.uol.com.br/emcimadahora/"
    host "http://www1.folha.uol.com.br/emcimadahora/"
    featured_level 0
    selector "#newslist .nl2"
    url_pattern ".nlArticle a"
    title ".nlSection"
    subtitle ".nlArticle a"
    limit 3
  end

  factory :news do
    sequence(:url) {|n| "http://somenews.com/#{n}" }
  end

end
