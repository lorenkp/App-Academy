Pokedex.Views = {}

Pokedex.Views.PokemonIndex = Backbone.View.extend({
  events: {
    "click ul.poke-list-item": "selectPokemonFromList"
  },

  initialize: function (options) {
    this.listenTo(this.collection, "sync add", this.render);
  },

  addPokemonToList: function (pokemon) {
    this.$el.append(JST["pokemonListItem"]({pokemon: pokemon}));
  },

  refreshPokemon: function (options) {
  },

  render: function () {
    this.$el.empty();
    this.collection.each( function (pokemon) {
      this.addPokemonToList(pokemon);
    }.bind(this));
  },

  selectPokemonFromList: function (event) {
    console.log($(event.currentTarget).text());
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


$(function () {
  var pokesCollection = new Pokedex.Collections.Pokemon();
  pokesCollection.fetch();
  var pokemonIndex = new Pokedex.Views.PokemonIndex({collection: pokesCollection});
  pokemonIndex.refreshPokemon();
  $("#pokedex .pokemon-list").html(pokemonIndex.$el);
});
