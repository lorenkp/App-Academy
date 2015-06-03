JournalApp.Views.PostsIndex = Backbone.View.extend({

  initialize: function() {
    var that = this;
    that.listenTo(that.collection, "remove", that.render);
    that.listenTo(that.collection, "reset", that.render);
  },

  template: JST['posts/index'],
  render: function() {
    var content = this.template();
    this.$el.html(content);
    var that = this;
    this.collection.each(function(post) {
      var itemView = new JournalApp.Views.PostsIndexItem({ model: post });
      that.$el.find('ul').append(itemView.render().$el);
    });
    return this;
  }


});
