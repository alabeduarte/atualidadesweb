function News(options){
  this.title = options["title"];
  this.subtitle = options["subtitle"];
  this.image = options["image"];
  this.featuredLevel = options["featuredLevel"];

  if (this.subtitle && this.subtitle !== this.title) {
    this.title = this.subtitle;
    this.subtitle = null;
  }
}
