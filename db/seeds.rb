NewsFeed.create(
              host: 'http://g1.globo.com',
              selector: '#glb-corpo .glb-area .chamada-principal',
              url_pattern: 'a',
              title: '.chapeu',
              subtitle: 'a',
              image_source: '.foto a img')
NewsFeed.create(
              host: 'http://noticias.uol.com.br/noticias/',
              selector: 'div.geral section article.news',
              url_pattern: 'h1 a',
              title: 'h1 a span',
              subtitle: 'p',
              image_source: 'h1 a img',
              date_tag: 'time')
NewsFeed.create(
              host: 'http://www1.folha.uol.com.br/emcimadahora/',
              selector: '#newslist .nl2',
              url_pattern: '.nlArticle a',
              title: '.nlSection',
              subtitle: '.nlArticle a',
              date_tag: '.nlHour')
