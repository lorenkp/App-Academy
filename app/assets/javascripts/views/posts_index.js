JournalApp.Views.PostsIndex = Backbone.View.extend({
  template: JST['posts/index'],
  render: function() {
    this.$el.html(this.template({posts: this.collection}));
    return this;
  }

});
