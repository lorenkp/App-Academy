NewsReader.Collections.Entries = Backbone.Collection.extend({
  model: NewsReader.Models.Entry,

  url: function() {
    return '/api/feeds/' + this.feed.id + '/entries';
  },

  initialize: function(options) {
    this.feed = options.feed;
  },

});
