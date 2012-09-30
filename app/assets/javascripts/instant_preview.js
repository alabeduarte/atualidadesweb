;(function(){
  var InstantPreview,
      elements = [];
  window.InstantPreview = InstantPreview = {};

  InstantPreview.init = function() {
    $('ul.news li a').mouseover(function(){
      console.log("hey!", this.href);
    });
  };
  $(function(){ InstantPreview.init(); });
})();
