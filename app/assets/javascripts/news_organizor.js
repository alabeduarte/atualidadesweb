;(function(){
  var NewsOrganizor,
      elements = [];
  window.NewsOrganizor = NewsOrganizor = {};

  NewsOrganizor.init = function() {
    console.log("initializing...");
    $('.breaking-news ul li').each(function(index, item){
      var news = new News({
        title: "blabla",
        subtitle: "blablbala",
        image: "blalbalba",
        featuredLevel: "0"
      });
      elements.push(news);
      console.log("creating news:", news);
    });
  };

  NewsOrganizor.sort = function() {
  };

  $(function(){ NewsOrganizor.init(); });
})();
