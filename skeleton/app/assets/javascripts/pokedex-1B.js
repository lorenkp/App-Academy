Pokedex.RootView.prototype.renderPokemonDetail = function (pokemon) {
  var $img = $('<img>').attr('src', pokemon.get('image_url'));
  var $div = $('<div>').addClass('detail').append($img);
  this.$pokeDetail.append($div);
//   $('<div>').addClass('detail').append('<img>')
//     .attr('src', pokemon.get("image_url")).appendTo(this.$pokeDetail);
//     // debugger
};

Pokedex.RootView.prototype.selectPokemonFromList = function (event) {
  event.preventDefault();
  var $li = $(event.currentTarget);
  var pokemonId = $li.data('id');
  var pokemon = new Pokedex.Models.Pokemon({ id: pokemonId });
  var that = this;
  // debugger
  pokemon.fetch({
    success: function () {
      that.renderPokemonDetail(pokemon);
    }
  });
};
