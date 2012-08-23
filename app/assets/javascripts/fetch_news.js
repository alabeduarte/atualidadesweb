function fetchNews() {
  var news = [1, 2, 3];
  var shufleNews = arrayShuffle(news);
  fetchNewsFrom('http://s.glbimg.com/jo/g1/media/widget_header/img/marca.png'
        , 'g1_news.json'
        , '#' + shufleNews[0]
  );
  fetchNewsFrom('http://s.glbimg.com/jo/g1/media/widget_header/img/marca.png'
        , 'g1_bahia_news.json'
        , '#' + shufleNews[1]
  );
  fetchNewsFrom('http://fw2.atarde.com.br/fw/img/2012/01/marcaAtarde1.png'
        , 'atarde_news.json'
        , '#' + shufleNews[2]
  );
}

function arrayShuffle(oldArray) {
  var newArray = oldArray.slice();
  var len = newArray.length;
  var i = len;
   while (i--) {
    var p = parseInt(Math.random()*len);
    var t = newArray[i];
      newArray[i] = newArray[p];
      newArray[p] = t;
  }
  return newArray;
};

function fetchNewsFrom(logo, json, sectionId) {
  $(sectionId).css('display', 'block');

  $(sectionId).mouseover(function() {
    $(this).addClass('main');
  }).mouseout(function(){
      $(this).removeClass('main');
  });

  $(sectionId).append($('<ul>'));
  $.getJSON(json, function(data) {
    $.each(data, function(index, item){
      $(sectionId + ' ul').append($('<li>'));
      var url = item.url;
      var title = $.trim(item.title);
      var subtitle = $.trim(item.subtitle);
      var image = item.image;

      var urlId = 'url_' + index;

      if (!title) {
        title = subtitle;
      }
      var link = $('<a id="' + urlId + '" href="' + url + '" target="_blank">');
      //link.append($('<img src="' + logo + '" width="20px" height="12px">'));
      $(sectionId + ' ul li:last').append(link);
      if (image) {
        link.append($('<img class="image-news" src="'+ image +'">'));
      }
      if (title) {
        link.append($('<span class="title-news">' + title + '</span>'));
      }
      if (subtitle && title != subtitle) {
        if (title) {
          link.append($('<span class="subtitle-news">'+ subtitle +'</span>'));
        } else {
          link.append(subtitle);
        }
      }
      if ($('#content').height() < $(sectionId).height()) {
        var maxHeight = $(sectionId).height();
        $('#content').css('height', maxHeight + 'px');
      }
    });
  });
}
