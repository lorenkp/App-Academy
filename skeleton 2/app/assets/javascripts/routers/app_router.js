NewsReader.Routers.AppRouter = Backbone.Router.extend({
  initialize: function(options) {
    this.$rootEl = options.$rootEl;
  },

  routes: {
    "": "index"
  },

  index: function() {
    NewsReader.Collections.feeds.fetch();
    var indexView = new NewsReader.Views.FeedIndex({
      collection: NewsReader.Collections.feeds
    });
    this.swapView(indexView);
  },

  swapView: function(newView) {
    if (this.currentView) {
      this.currentView.remove();
    }
    this.currentView = newView;
    this.$rootEl.html(this.currentView.render().$el);
  }

});
