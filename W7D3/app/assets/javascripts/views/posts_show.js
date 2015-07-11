JournalApp.Views.PostsShow = Backbone.View.extend({
  template: JST['posts/show'],
  render: function() {
    this.$el.html(this.template({post: this.model}));
    return this;
  }
});
