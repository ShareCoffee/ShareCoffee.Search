chai = require 'chai'
sinon = require 'sinon'
chai.should()


root = global ? window

describe 'ShareCoffee.SuggestProperties', ->

  before () ->
    #Fake that ShareCoffee has been loaded
    root.ShareCoffee =
      REST:
        RequestProperties: ()->

    require '../src/ShareCoffee.PropertyObjects'

  it 'should create a constructor function for PropertyObjects in ShareCoffee', ->
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
    console.dir actual
    actual.should.equal "Search/suggest?querytext='SharePoint'"

  it 'should escape numbers in the url as required for REST', ->
    sut = new ShareCoffee.SuggestProperties()
    sut.culture = 1031
    actual = sut.getUrl()
    actual.should.be.an 'string'
    console.dir actual
    actual.should.equal "Search/suggest?culture=1031"

  it 'should escape booleans in the url as required for REST', ->
    sut = new ShareCoffee.SuggestProperties()
    sut.showpeoplenamesuggestions = false
    actual = sut.getUrl()
    actual.should.be.an 'string'
    console.dir actual
    actual.should.equal "Search/suggest?showpeoplenamesuggestions=false"

  it 'should provide & as parameter delimiter for the url', ->
    sut = new ShareCoffee.SuggestProperties()
    sut.showpeoplenamesuggestions = false
    sut.culture = 1031
    actual = sut.getUrl()
    actual.should.be.an 'string'
    console.dir actual
    actual.should.equal "Search/suggest?showpeoplenamesuggestions=false&culture=1031"
