Pokedex.Views = {}

Pokedex.Views.PokemonIndex = Backbone.View.extend({
  events: {
  },

  initialize: function () {
  },

  addPokemonToList: function (pokemon) {
  },

  refreshPokemon: function (options) {
  },

  render: function () {
  },

  selectPokemonFromList: function (event) {
  }
});

Pokedex.Views.PokemonDetail = Backbone.View.extend({
  events: {
  },

  refreshPokemon: function (options) {
  },

  render: function () {
    // var evaluatedTemplate = JST['pokemonDetail']({ pokemon: this.model });
    // // insert that evaluated result into the DOM
  },

  selectToyFromList: function (event) {
  }
});

Pokedex.Views.ToyDetail = Backbone.View.extend({
  render: function () {
  }
});

/*
$(function () {
  var pokemonIndex = new Pokedex.Views.PokemonIndex();
  pokemonIndex.refreshPokemon();
  $("#pokedex .pokemon-list").html(pokemonIndex.$el);
});
*/
