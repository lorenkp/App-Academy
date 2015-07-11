NewsReader.Views.FeedIndex = Backbone.View.extend({
  template: JST['feeds/index'],
  tagName: "ul",
  className: "feed-index",

  initialize: function() {
    this.listenTo(this.collection, "sync", this.render);
  },

  render: function() {
    var renderedContent = this.template();
    this.$el.html(renderedContent);

    this.collection.each(function(feed) {
      var feedItem = new NewsReader.Views.FeedIndexItem({
        model: feed
      });
      this.$el.append(feedItem.render().$el);
    }.bind(this));

    return this;
  },

});
