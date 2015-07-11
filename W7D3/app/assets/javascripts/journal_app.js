window.JournalApp = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    var posts = new JournalApp.Collections.Posts();
    posts.fetch({reset: true});
    this.$rootEl = $('.main');
    this._router = new JournalApp.Routers.Posts({ collection: posts, $rootEl: this.$rootEl });
    Backbone.history.start();
  }
};

$(document).ready(function(){
  JournalApp.initialize();
});
