root = global ? window

if not root.ShareCoffee?
  throw new Error("LoadError")

root.ShareCoffee.QueryProperties = class

  constructor: (@querytext, @selectproperties, @querytemplate) ->
    @isPostQuery = false
    @querytemplate = null unless @querytemplate?
    @enableinterleaving = null unless @enableinterleaving?
    @sourceid = null unless @sourceid?
    @rankingmodelid = null unless @rankingmodelid?
    @startrow = null unless @startrow?
    @rowlimit = null unless @rowlimit?
    @rowsperpage = null unless @rowsperpage?
    @selectproperties = null unless @selectproperties?
    @culture = null unless @culture?
    @refiners = null unless @refiners?
    @refinementfilters = null unless @refinementfilters?
    @hiddenconstraints = null unless @hiddenconstraints?
    @sortlist = null unless @sortlist?
    @enablestemming = null unless @enablestemming?
    @trimduplicates = null unless @trimduplicates?
    @trimduplicatesincludeid = null unless @trimduplicatesincludeid?
    @timeout = null unless @timeout?
    @enablenicknames = null unless @enablenicknames?
    @enablephonetic = null unless @enablephonetic?
    @enablefql = null unless @enablefql?
    @hithighlightedproperties = null unless @hithighlightedproperties?
    @bypassresulttypes = null unless @bypassresulttypes?
    @processbestbets = null  unless @processbestbets?
    @clienttype = null unless @clienttype?
    @personalizationdata = null unless @personalizationdata?
    @resultsurl = null unless @resultsurl?
    @querytag = null unless @querytag?
    @enablequeryrules = null unless @enablequeryrules?
    @enablesorting = null unless @enablesorting?
    @hostWebUrl = null
    @onSuccess = null
    @onError = null

  getUrl: () =>
    urlProperties = ['querytext', 'querytemplate', 'enableinterleaving', 'sourceid', 'rankingmodelid', 'startrow', 'rowlimit', 'rowsperpage', 'selectproperties',
    'culture', 'refiners', 'refinementfilters', 'hiddenconstraints', 'sortlist', 'enablestemming', 'trimduplicates', 'trimduplicatesincludeid',
    'timeout', 'enablenicknames', 'enablephonetic', 'enablefql', 'hithighlightedproperties', 'bypassresulttypes',
    'processbestbets', 'clienttype', 'personalizationdata', 'resultsurl', 'querytag', 'enablequeryrules', 'enablesorting']
    url = "Search/query?"
    for p of @
      propertyValue = @[p]
      if urlProperties.indexOf(p) > -1 and propertyValue?
        if typeof(propertyValue) is 'string'
          url = "#{url}#{p}='#{propertyValue}'&"
        else if typeof(propertyValue) is 'number' or typeof(propertyValue) is 'boolean'
          url = "#{url}#{p}=#{propertyValue}&"

    url.substr 0, url.length-1

  getRequestProperties: () =>
    new ShareCoffee.REST.RequestProperties @getUrl(), @hostWebUrl, null, null, @onSuccess, @onError

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

