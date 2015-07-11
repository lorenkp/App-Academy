JournalApp.Routers.Posts = Backbone.Router.extend({
  initialize: function(options) {
    this.$rootEl = options.$rootEl;
    this.collection = options.collection;
  },

  routes: {
    "": "postsIndex",
    "posts/:id": "postShow"
  },

  _swapView: function(newView) {
    this._currentView && this._currentView.remove();
    this._currentView = newView;
    this.$rootEl.html(newView.render().$el);
  },

  postsIndex: function() {
    var view = new JournalApp.Views.PostsIndex({ collection: this.collection });
    this._swapView(view);
  },

  postShow: function(id) {
    var model = this.collection.getOrFetch(id);
    var view = new JournalApp.Views.PostsShow({ model: model});
    this._swapView(view);
  }
});
