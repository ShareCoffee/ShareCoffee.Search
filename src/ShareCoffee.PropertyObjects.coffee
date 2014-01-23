root = global ? window

if not root.ShareCoffee?
  throw new Error("LoadError")

root.ShareCoffee.SuggestProperties = class

  constructor: (@querytext, @inumberofquerysuggestions, @inumberofresultsuggestions, @fprequerysuggestions, @fhithighlighting, @fcapitalizefirstletters, @showpeoplenamesuggestions, @culture) ->
    @inumberofquerysuggestions = null unless @inumberofquerysuggestions?
    @inumberofresultsuggestions = null unless @inumberofresultsuggestions?
    @fprequerysuggestions = null unless @fprequerysuggestions?
    @fhithighlighting = null unless @fhithighlighting?
    @fcapitalizefirstletters = null unless @fcapitalizefirstletters?
    @showpeoplenamesuggestions = null unless @showpeoplenamesuggestions?
    @culture = null unless @culture?

