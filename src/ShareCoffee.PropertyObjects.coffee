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
    @hostWebUrl = null
    @onSuccess = null
    @onError = null

  getRequestProperties: () =>
    new ShareCoffee.REST.RequestProperties @getUrl(), @hostWebUrl, null, null, @onSuccess, @onError

  getUrl: () =>
    urlProperties = ['querytext', 'inumberofquerysuggestions', 'inumberofresultsuggestions', 'fprequerysuggestions', 'fhithighlighting', 'fcapitalizefirstletters', 'showpeoplenamesuggestions', 'culture']
    url = "Search/suggest?"
    for p of @
      propertyValue = @[p]
      if urlProperties.indexOf(p) > -1 and propertyValue?
        if typeof(propertyValue) is 'string'
          url = "#{url}#{p}='#{propertyValue}'&"
        else if typeof(propertyValue) is 'number' or typeof(propertyValue) is 'boolean'
          url = "#{url}#{p}=#{propertyValue}&"

    url.substr 0, url.length-1

