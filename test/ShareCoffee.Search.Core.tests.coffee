chai = require 'chai'
sinon = require 'sinon'
chai.should()

root = global ? window

describe 'ShareCoffee.Search.Core', ->

  it 'should throw an loadError when ShareCoffee is not loaded', ->
    (-> require('../src/ShareCoffee.Search.Core')).should.throw ''



describe 'ShareCoffee.Search.Core', ->

  before () ->
    #Fake that ShareCoffee has been loaded
    root.ShareCoffee =
      RESTFactory: (method) ->
        {method: method}

    require '../src/ShareCoffee.Search.Core'

  it 'should register a Search subnamespace on ShareCoffee', ->
    root.ShareCoffee.should.have.property 'Search'
    root.ShareCoffee.Search.should.be.an 'object'

  it 'should expose an build property on Search', ->
    root.ShareCoffee.Search.should.have.property 'build'
    root.ShareCoffee.Search.build.should.be.an 'object'

  it 'should expose query on build as a property', ->
    root.ShareCoffee.Search.build.should.have.property 'query'
    root.ShareCoffee.Search.build.query.should.be.an 'object'

  it 'should expose postQuery on build as a property', ->
    root.ShareCoffee.Search.build.should.have.property 'postQuery'
    root.ShareCoffee.Search.build.postQuery.should.be.an 'object'

  it 'should expose suggest on build as a property', ->
    root.ShareCoffee.Search.build.should.have.property 'suggest'
    root.ShareCoffee.Search.build.suggest.should.be.an 'object'

  it 'should expose for on suggest as a property', ->
    root.ShareCoffee.Search.build.suggest.should.have.property 'for'
    root.ShareCoffee.Search.build.suggest.for.should.be.an 'object'

  it 'should expose for on query as a property', ->
    root.ShareCoffee.Search.build.query.should.have.property 'for'
    root.ShareCoffee.Search.build.query.for.should.be.an 'object'

  it 'should expose for on postQuery as a property', ->
    root.ShareCoffee.Search.build.postQuery.should.have.property 'for'
    root.ShareCoffee.Search.build.postQuery.for.should.be.an 'object'

  it 'should create a new instance of ShareCoffee.RESTFactory internally when query is accessed with GET', ->

    res = root.ShareCoffee.Search.build.query.for
    res.should.be.an 'object'
    res.should.have.property 'method'
    res.method.should.be.an 'string'
    res.method.should.equal 'GET'

  it 'should create a new instance of ShareCoffee.RESTFactory internally when postQuery is accessed with POST', ->

    res = root.ShareCoffee.Search.build.postQuery.for
    res.should.be.an 'object'
    res.should.have.property 'method'
    res.method.should.be.an 'string'
    res.method.should.equal 'POST'

  it 'should create a new instance of ShareCoffee.RESTFactory internally when suggest is accessed with GET', ->

    res = root.ShareCoffee.Search.build.suggest.for
    res.should.be.an 'object'
    res.should.have.property 'method'
    res.method.should.be.an 'string'
    res.method.should.equal 'GET'
