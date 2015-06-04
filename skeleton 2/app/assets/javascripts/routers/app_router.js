NewsReader.Routers.AppRouter = Backbone.Router.extend({
  initialize: function(options) {
    this.$rootEl = options.$rootEl;
  },

  routes: {
    "": "index",
    "api/feeds/:id": "feedShow"
  },

  index: function() {
    NewsReader.Collections.feeds.fetch();
    var indexView = new NewsReader.Views.FeedIndex({
      collection: NewsReader.Collections.feeds
    });
    this.swapView(indexView);
  },

  feedShow: function(id) {
    var feed = NewsReader.Collections.feeds.getOrFetch(id);
    var feedShow = new NewsReader.Views.Feed({
      model: feed
    });

    this.swapView(feedShow);
    console.log("Showing Feed " + id);
  },

  swapView: function(newView) {
    if (this.currentView) {
      this.currentView.remove();
    }
    this.currentView = newView;
    this.$rootEl.html(this.currentView.render().$el);
  }

});
