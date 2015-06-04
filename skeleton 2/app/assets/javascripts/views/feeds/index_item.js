NewsReader.Views.FeedIndexItem = Backbone.View.extend({
  template: JST['feeds/index_item'],
  tagName: "li",
  className: "feed-index-item",

  render: function() {
    var renderedContent = this.template({
      feed: this.model
    });
    this.$el.html(renderedContent);

    return this;
  },

});
