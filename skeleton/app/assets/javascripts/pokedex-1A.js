Pokedex.RootView.prototype.addPokemonToList = function (pokemon) {
  $('<li>').text(pokemon.get('name') + ' ' + pokemon.get('poke_type'))
    .addClass('poke-list-item').appendTo(this.$pokeList);
};

Pokedex.RootView.prototype.refreshPokemon = function () {
  var that = this;
  this.pokes.fetch({
    success: function (pokemon) {
      pokemon.forEach(function(el){
        that.addPokemonToList(el);
      });
    }
  })
};
