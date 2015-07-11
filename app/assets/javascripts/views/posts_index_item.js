JournalApp.Views.PostsIndexItem = Backbone.View.extend({
  tagName: 'li',

  template: JST['posts/item'],
  render: function() {
    this.$el.html(this.template({post: this.model}));
    return this;
  },

  events: {
    "click button": "deleteItem"
  },

  deleteItem: function() {
    this.model.destroy({wait: true})
  }


});
