// var content = {
//   minHeight: 0
// };
// 
// function fetchNews() {
//   var news = arrayShuffle([1, 2, 3]);
//   fetchNewsFrom('http://s.glbimg.com/jo/g1/media/widget_header/img/marca.png'
//         , 'g1_news.json'
//         , '#' + news[0]
//   );
//   fetchNewsFrom('http://s.glbimg.com/jo/g1/media/widget_header/img/marca.png'
//         , 'g1_bahia_news.json'
//         , '#' + news[1]
//   );
//   fetchNewsFrom('http://fw2.atarde.com.br/fw/img/2012/01/marcaAtarde1.png'
//         , 'atarde_news.json'
//         , '#' + news[2]
//   );
// }
// 
// function arrayShuffle(oldArray) {
//   var newArray = oldArray.slice();
//   var len = newArray.length;
//   var i = len;
//    while (i--) {
//     var p = parseInt(Math.random()*len);
//     var t = newArray[i];
//       newArray[i] = newArray[p];
//       newArray[p] = t;
//   }
//   return newArray;
// };
// 
// function fetchNewsFrom(logo, json, sectionId) {
//   $(sectionId).mouseover(function() {
//     $(this).addClass('main');
//     resize(getHeight(sectionId));
//   }).mouseout(function(){
//       $(this).removeClass('main');
//       resize(content.minHeight);
//   });
// 
//   $(sectionId).append($('<ul>'));
//   $.getJSON(json, function(data) {
//     $.each(data, function(index, item){
//       $(sectionId + ' ul').append($('<li>'));
//       var url = item.url;
//       var title = $.trim(item.title);
//       var subtitle = $.trim(item.subtitle);
//       var image = item.image;
// 
//       var urlId = 'url_' + index;
// 
//       if (!title) {
//         title = subtitle;
//       }
//       var link = $('<a id="' + urlId + '" href="' + url + '" target="_blank">');
//       //link.append($('<img src="' + logo + '" width="20px" height="12px">'));
//       $(sectionId + ' ul li:last').append(link);
//       if (image) {
//         link.append($('<img class="image-news" src="'+ image +'">'));
//       }
//       if (title) {
//         link.append($('<span class="title-news">' + title + '</span>'));
//       }
//       if (subtitle && title != subtitle) {
//         if (title) {
//           link.append($('<span class="subtitle-news">'+ subtitle +'</span>'));
//         } else {
//           link.append(subtitle);
//         }
//       }
//       content.minHeight = getHeight(sectionId);
//       resize(content.minHeight);
//       $(sectionId).css('display', 'block');
//     });
//   });
// }
// 
// function getHeight(sectionId) {
//   if ($('#content').height() < $(sectionId).height()) {
//     return $(sectionId).height();
//   } else return $('#content').height();
// }
// 
// function resize(height) {
//     $('#content').css('height', height + 'px');
// }
