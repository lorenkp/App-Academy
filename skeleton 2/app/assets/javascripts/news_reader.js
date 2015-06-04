window.NewsReader = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    console.log('Hello from Backbone!');
    var appRouter = new NewsReader.Routers.AppRouter({
      "$rootEl": $('#content')
    });
    Backbone.history.start();

  }
};

$(document).ready(function(){
  NewsReader.initialize();
});
