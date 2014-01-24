chai = require 'chai'
sinon = require 'sinon'
chai.should()

root = global ? window

describe 'ShareCoffee.Properties', ->

  before () ->
    root.ShareCoffee =
      REST:
        RequestProperties: () ->

    require '../src/ShareCoffee.PropertyObjects'

  describe 'ShareCoffee.QueryProperties', ->

    it 'should exist a constructor function for QueryProperties in ShareCoffee', ->
      root.ShareCoffee.should.have.property 'QueryProperties'
      root.ShareCoffee.QueryProperties.should.be.an 'function'

    it 'should accept and store querytext as a ctor parameter', ->
      actual = new ShareCoffee.QueryProperties 'SharePoint'
      actual.should.have.property 'querytext'
      actual.querytext.should.equal 'SharePoint'

    it 'should allow to set querytext on an existing instance', ->
      actual = new ShareCoffee.QueryProperties()
      actual.querytext = 'SharePoint'
      actual.querytext.should.equal 'SharePoint'
    it 'should accept and store selectproperties as a ctor parameter', ->
      actual = new ShareCoffee.QueryProperties '', 'Foo'
      actual.should.have.property 'selectproperties'
      actual.selectproperties.should.equal 'Foo'
    it 'should accept and store querytemplate as a ctor parameter', ->
      actual = new ShareCoffee.QueryProperties '', '', 'Foo'
      actual.should.have.property 'querytemplate'
      actual.querytemplate.should.equal 'Foo'

    it 'should allow to set querytemplate on an existing instance', ->
      actual = new ShareCoffee.QueryProperties()
      actual.querytemplate = 't'
      actual.querytemplate.should.equal 't'

    it 'should allow to set enableinterleaving on an existing instance', ->
      actual = new ShareCoffee.QueryProperties()
      actual.enableinterleaving = false
      actual.enableinterleaving.should.equal false

    it 'should allow to set sourceid on an existing instance', ->
      actual = new ShareCoffee.QueryProperties()
      actual.sourceid = 't'
      actual.sourceid.should.equal 't'

    it 'should allow to set rankingmodelid on an existing instance', ->
      actual = new ShareCoffee.QueryProperties()
      actual.rankingmodelid = 't'
      actual.rankingmodelid.should.equal 't'

    it 'should allow to set startrow on an existing instance', ->
      actual = new ShareCoffee.QueryProperties()
      actual.startrow = 1
      actual.startrow.should.equal 1

    it 'should allow to set rowlimit on an existing instance', ->
      actual = new ShareCoffee.QueryProperties()
      actual.rowlimit = 2
      actual.rowlimit.should.equal 2

    it 'should allow to set rowsperpage on an existing instance', ->
      actual = new ShareCoffee.QueryProperties()
      actual.rowsperpage = 2
      actual.rowsperpage.should.equal 2

    it 'should allow to set selectproperties on an existing instance', ->
      actual = new ShareCoffee.QueryProperties()
      actual.selectproperties = 't'
      actual.selectproperties.should.equal 't'

    it 'should allow to set culture on an existing instance', ->
      actual = new ShareCoffee.QueryProperties()
      actual.culture = 1031
      actual.culture.should.equal 1031

    it 'should allow to set refiners on an existing instance', ->
      actual = new ShareCoffee.QueryProperties()
      actual.refiners = 't'
      actual.refiners.should.equal 't'

    it 'should allow to set refinementfilters on an existing instance', ->
      actual = new ShareCoffee.QueryProperties()
      actual.refinementfilters = 't'
      actual.refinementfilters.should.equal 't'

    it 'should allow to set hiddenconstraints on an existing instance', ->
      actual = new ShareCoffee.QueryProperties()
      actual.hiddenconstraints = 't'
      actual.hiddenconstraints.should.equal 't'

    it 'should allow to set sortlist on an existing instance', ->
      actual = new ShareCoffee.QueryProperties()
      actual.sortlist = 't'
      actual.sortlist.should.equal 't'

    it 'should allow to set enablestemming on an existing instance', ->
      actual = new ShareCoffee.QueryProperties()
      actual.enablestemming = false
      actual.enablestemming.should.equal false

    it 'should allow to set trimduplicates on an existing instance', ->
      actual = new ShareCoffee.QueryProperties()
      actual.trimduplicates = false
      actual.trimduplicates.should.equal false

    it 'should allow to set trimduplicatesincludeid on an existing instance', ->
      actual = new ShareCoffee.QueryProperties()
      actual.trimduplicatesincludeid = 123
      actual.trimduplicatesincludeid.should.equal 123

    it 'should allow to set timeout on an existing instance', ->
      actual = new ShareCoffee.QueryProperties()
      actual.timeout = 3000
      actual.timeout.should.equal 3000

    it 'should allow to set enablenicknames on an existing instance', ->
      actual = new ShareCoffee.QueryProperties()
      actual.enablenicknames = true
      actual.enablenicknames.should.equal true

    it 'should allow to set enablephonetic on an existing instance', ->
      actual = new ShareCoffee.QueryProperties()
      actual.enablephonetic = true
      actual.enablephonetic.should.equal true

    it 'should allow to set enablefql on an existing instance', ->
      actual = new ShareCoffee.QueryProperties()
      actual.enablefql = true
      actual.enablefql.should.equal true

    it 'should allow to set hithighlightedproperties on an existing instance', ->
      actual = new ShareCoffee.QueryProperties()
      actual.hithighlightedproperties = 't'
      actual.hithighlightedproperties.should.equal 't'

    it 'should allow to set bypassresulttypes on an existing instance', ->
      actual = new ShareCoffee.QueryProperties()
      actual.bypassresulttypes = false
      actual.bypassresulttypes.should.equal false

    it 'should allow to set processbestbets on an existing instance', ->
      actual = new ShareCoffee.QueryProperties()
      actual.processbestbets = false
      actual.processbestbets.should.equal false

    it 'should allow to set clienttype on an existing instance', ->
      actual = new ShareCoffee.QueryProperties()
      actual.clienttype = 't'
      actual.clienttype.should.equal 't'

    it 'should allow to set personalizationdata on an existing instance', ->
      actual = new ShareCoffee.QueryProperties()
      actual.personalizationdata = 't'
      actual.personalizationdata.should.equal 't'

    it 'should allow to set resultsurl on an existing instance', ->
      actual = new ShareCoffee.QueryProperties()
      actual.resultsurl = 't'
      actual.resultsurl.should.equal 't'

    it 'should allow to set querytag on an existing instance', ->
      actual = new ShareCoffee.QueryProperties()
      actual.querytag = 't'
      actual.querytag.should.equal 't'

    it 'should allow to set enablequeryrules on an existing instance', ->
      actual = new ShareCoffee.QueryProperties()
      actual.enablequeryrules = false
      actual.enablequeryrules.should.equal false

    it 'should allow to set enablesorting on an existing instance', ->
      actual = new ShareCoffee.QueryProperties()
      actual.enablesorting = false
      actual.enablesorting.should.equal false

    it 'should expose a getRequestProperties method on an QueryProperties instance', ->
      sut = new ShareCoffee.QueryProperties()
      sut.should.have.property 'getRequestProperties'
      sut.getRequestProperties.should.be.an 'function'

    it 'should expose a getUrl method on an QueryProperties instance', ->
      sut = new ShareCoffee.QueryProperties()
      sut.should.have.property 'getUrl'
      sut.getUrl.should.be.an 'function'

    it 'should return plain suggest url when no property is set', ->
      sut = new ShareCoffee.QueryProperties()
      actual = sut.getUrl()
      actual.should.be.an 'string'
      actual.should.equal 'Search/query'

    it 'should escape strings in the url as required for REST', ->
      sut = new ShareCoffee.QueryProperties()
      sut.querytext = "SharePoint"
      actual = sut.getUrl()
      actual.should.be.an 'string'
      actual.should.equal "Search/query?querytext='SharePoint'"

    it 'should escape numbers in the url as required for REST', ->
      sut = new ShareCoffee.QueryProperties()
      sut.startrow = 10
      actual = sut.getUrl()
      actual.should.be.an 'string'
      actual.should.equal "Search/query?startrow=10"

    it 'should escape booleans in the url as required for REST', ->
      sut = new ShareCoffee.QueryProperties()
      sut.trimduplicates = false
      actual = sut.getUrl()
      actual.should.be.an 'string'
      actual.should.equal "Search/query?trimduplicates=false"

    it 'should provide & as parameter delimiter for the url', ->
      sut = new ShareCoffee.QueryProperties()
      sut.trimduplicates = false
      sut.startrow = 10
      actual = sut.getUrl()
      actual.should.be.an 'string'
      actual.should.equal "Search/query?startrow=10&trimduplicates=false"

  describe 'ShareCoffee.SuggestProperties', ->

    it 'should exist a constructor function for PropertyObjects in ShareCoffee', ->
      root.ShareCoffee.should.have.property 'SuggestProperties'
      root.ShareCoffee.SuggestProperties.should.be.an 'function'

    it 'should accept and store querytext as a ctor parameter', ->
      actual = new ShareCoffee.SuggestProperties 'SharePoint'
      actual.should.have.property 'querytext'
      actual.querytext.should.equal 'SharePoint'

    it 'should allow to set querytext on an existing instance', ->
      actual = new ShareCoffee.SuggestProperties()
      actual.querytext = 'SharePoint'
      actual.querytext.should.equal 'SharePoint'

    it 'should accept and store inumberofquerysuggestions as a ctor parameter', ->
      actual = new ShareCoffee.SuggestProperties '', 1
      actual.should.have.property 'inumberofquerysuggestions'
      actual.inumberofquerysuggestions.should.equal 1

    it 'should allow to set inumberofquerysuggestions on an existing instance', ->
      actual = new ShareCoffee.SuggestProperties()
      actual.inumberofquerysuggestions = 2
      actual.inumberofquerysuggestions.should.equal 2

    it 'should return null for inumberofquerysuggestions if not provided by dev', ->
      actual = new ShareCoffee.SuggestProperties()
      actual.should.have.property 'inumberofquerysuggestions'
      chai.assert.isNull actual.inumberofquerysuggestions

    it 'should accept and store inumberofresultsuggestions as a ctor parameter', ->
      actual = new ShareCoffee.SuggestProperties '', 1, 2
      actual.should.have.property 'inumberofresultsuggestions'
      actual.inumberofresultsuggestions.should.equal 2

    it 'should allow to set inumberofresultsuggestions on an existing instance', ->
      actual = new ShareCoffee.SuggestProperties()
      actual.inumberofresultsuggestions = 2
      actual.inumberofresultsuggestions.should.equal 2

    it 'should return null for inumberofresultsuggestions if not provided by dev', ->
      actual = new ShareCoffee.SuggestProperties()
      actual.should.have.property 'inumberofresultsuggestions'
      chai.assert.isNull actual.inumberofresultsuggestions

    it 'should accept and store fprequerysuggestions as a ctor parameter', ->
      actual = new ShareCoffee.SuggestProperties '', 1, 2, true
      actual.should.have.property 'fprequerysuggestions'
      actual.fprequerysuggestions.should.be.true

    it 'should allow to set fprequerysuggestions on an existing instance', ->
      actual = new ShareCoffee.SuggestProperties()
      actual.fprequerysuggestions = true
      actual.fprequerysuggestions.should.be.true

    it 'should return null for fprequerysuggestions if not provided by dev', ->
      actual = new ShareCoffee.SuggestProperties()
      actual.should.have.property 'fprequerysuggestions'
      chai.assert.isNull actual.fprequerysuggestions

    it 'should accept and store fhithighlighting as a ctor parameter', ->
      actual = new ShareCoffee.SuggestProperties '', 1, 2, true, true
      actual.should.have.property 'fhithighlighting'
      actual.fhithighlighting.should.be.true

    it 'should allow to set fhithighlighting on an existing instance', ->
      actual = new ShareCoffee.SuggestProperties()
      actual.fhithighlighting = true
      actual.fhithighlighting.should.be.true

    it 'should return null for fhithighlighting if not provided by dev', ->
      actual = new ShareCoffee.SuggestProperties()
      actual.should.have.property 'fhithighlighting'
      chai.assert.isNull actual.fhithighlighting

    it 'should accept and store fcapitalizefirstletters as a ctor parameter', ->
      actual = new ShareCoffee.SuggestProperties '', 1, 2, true, true, true
      actual.should.have.property 'fcapitalizefirstletters'
      actual.fcapitalizefirstletters.should.be.true

    it 'should allow to set fcapitalizefirstletters on an existing instance', ->
      actual = new ShareCoffee.SuggestProperties()
      actual.fcapitalizefirstletters = true
      actual.fcapitalizefirstletters.should.be.true

    it 'should return null for fcapitalizefirstletters if not provided by dev', ->
      actual = new ShareCoffee.SuggestProperties()
      actual.should.have.property 'fcapitalizefirstletters'
      chai.assert.isNull actual.fcapitalizefirstletters

    it 'should accept and store showpeoplenamesuggestions as a ctor parameter', ->
      actual = new ShareCoffee.SuggestProperties '', 1, 2, true, true, true, true
      actual.should.have.property 'showpeoplenamesuggestions'
      actual.showpeoplenamesuggestions.should.be.true

    it 'should allow to set showpeoplenamesuggestions on an existing instance', ->
      actual = new ShareCoffee.SuggestProperties()
      actual.showpeoplenamesuggestions = true
      actual.showpeoplenamesuggestions.should.be.true

    it 'should return null for showpeoplenamesuggestions if not provided by dev', ->
      actual = new ShareCoffee.SuggestProperties()
      actual.should.have.property 'showpeoplenamesuggestions'
      chai.assert.isNull actual.showpeoplenamesuggestions

    it 'should accept and store culture as a ctor parameter', ->
      actual = new ShareCoffee.SuggestProperties '', 1, 2, true, true, true, true, 1033
      actual.should.have.property 'culture'
      actual.culture.should.equal 1033

    it 'should allow to set culture on an existing instance', ->
      actual = new ShareCoffee.SuggestProperties()
      actual.culture = 1033
      actual.culture.should.equal 1033

    it 'should return null for culture if not provided by dev', ->
      actual = new ShareCoffee.SuggestProperties()
      actual.should.have.property 'culture'
      chai.assert.isNull actual.culture

    it 'should expose an hostWebUrl property', ->
      actual = new ShareCoffee.SuggestProperties()
      actual.should.have.property 'hostWebUrl'
      chai.assert.isNull actual.hostWebUrl
      actual.hostWebUrl = "foo"
      actual.hostWebUrl.should.equal "foo"

    it 'should expose an onSuccess property', ->
      actual = new ShareCoffee.SuggestProperties()
      actual.should.have.property 'onSuccess'
      chai.assert.isNull actual.onSuccess
      actual.onSuccess = () ->
      actual.onSuccess.should.be.an 'function'

    it 'should expose an onError property', ->
      actual = new ShareCoffee.SuggestProperties()
      actual.should.have.property 'onError'
      chai.assert.isNull actual.onError
      actual.onError = () ->
      actual.onError.should.be.an 'function'

    it 'should expose a getRequestProperties method', ->
      sut = new ShareCoffee.SuggestProperties()
      sut.should.have.property 'getRequestProperties'
      sut.getRequestProperties.should.be.an 'function'

    it 'should return an instance of ShareCoffee.REST.RequestProperties', ->
      spy = sinon.spy ShareCoffee.REST, 'RequestProperties'
      sut = new ShareCoffee.SuggestProperties()
      actual = sut.getRequestProperties()
      spy.calledOnce.should.be.true
      spy.calledWithExactly('Search/suggest', null, null, null, null, null).should.be.true

    it 'should expose a getUrl function', ->
      sut = new ShareCoffee.SuggestProperties()
      sut.should.have.property 'getUrl'
      sut.getUrl.should.be.an 'function'

    it 'should return plain suggest url when no property is set', ->
      sut = new ShareCoffee.SuggestProperties()
      actual = sut.getUrl()
      actual.should.be.an 'string'
      actual.should.equal 'Search/suggest'

    it 'should escape strings in the url as required for REST', ->
      sut = new ShareCoffee.SuggestProperties()
      sut.querytext = "SharePoint"
      actual = sut.getUrl()
      actual.should.be.an 'string'
      actual.should.equal "Search/suggest?querytext='SharePoint'"

    it 'should escape numbers in the url as required for REST', ->
      sut = new ShareCoffee.SuggestProperties()
      sut.culture = 1031
      actual = sut.getUrl()
      actual.should.be.an 'string'
      actual.should.equal "Search/suggest?culture=1031"

    it 'should escape booleans in the url as required for REST', ->
      sut = new ShareCoffee.SuggestProperties()
      sut.showpeoplenamesuggestions = false
      actual = sut.getUrl()
      actual.should.be.an 'string'
      actual.should.equal "Search/suggest?showpeoplenamesuggestions=false"

    it 'should provide & as parameter delimiter for the url', ->
      sut = new ShareCoffee.SuggestProperties()
      sut.showpeoplenamesuggestions = false
      sut.culture = 1031
      actual = sut.getUrl()
      actual.should.be.an 'string'
      actual.should.equal "Search/suggest?showpeoplenamesuggestions=false&culture=1031"
