Pokedex.RootView.prototype.renderPokemonDetail = function (pokemon) {
  $('<div>').addClass('detail').append('<img>')
    .attr('src', pokemon.get("image_url")).appendTo(this.$pokeDetail);
};

Pokedex.RootView.prototype.selectPokemonFromList = function (event) {
};
