chai = require 'chai'
sinon = require 'sinon'
chai.should()


root = global ? window

describe 'ShareCoffee.SuggestProperties', ->

  before () ->
    #Fake that ShareCoffee has been loaded
    root.ShareCoffee = {}
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

