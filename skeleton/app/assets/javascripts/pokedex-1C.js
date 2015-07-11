Pokedex.RootView.prototype.createPokemon = function (attrs, callback) {
  var newPokemon = new Pokedex.Models.Pokemon(attrs);
  var that = this;
  // debugger
  newPokemon.save( {}, {success: function() {
    that.pokes.add(newPokemon);
    that.addPokemonToList(newPokemon);
    // debugger;
    callback.call(that, newPokemon);
    // debugger;
  }});
};

Pokedex.RootView.prototype.submitPokemonForm = function (event) {
  event.preventDefault();
  var that = this;
  this.createPokemon($(event.currentTarget).serializeJSON(),
    that.renderPokemonDetail);
};
