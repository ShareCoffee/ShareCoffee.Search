chai = require 'chai'
sinon = require 'sinon'
chai.should()

root = global ? window

describe 'ShareCoffee.REST.Search.Core', ->

  it 'should throw an loadError when ShareCoffee is not loaded', ->
    (-> require('../src/ShareCoffee.REST.Search')).should.throw ''



describe 'ShareCoffee.REST.Search.Core', ->

  before () ->
    #Fake that ShareCoffee has been loaded
    root.ShareCoffee =
      REST: {}
      RESTFactory: (method) ->
        {method: method}

    require '../src/ShareCoffee.REST.Search'

  it 'should register a Search subnamespace on ShareCoffee.REST', ->
    root.ShareCoffee.REST.should.have.property 'Search'
    root.ShareCoffee.REST.Search.should.be.an 'object'

  it 'should expose MaxUrlLength on ShareCoffee', ->
      ShareCoffee.should.have.property 'MaxUrlLength'
      ShareCoffee.MaxUrlLength.should.be.an 'number'

  it 'should expose an build property on Search', ->
    root.ShareCoffee.REST.Search.should.have.property 'build'
    root.ShareCoffee.REST.Search.build.should.be.an 'object'

  it 'should expose query on build as a property', ->
    root.ShareCoffee.REST.Search.build.should.have.property 'query'
    root.ShareCoffee.REST.Search.build.query.should.be.an 'object'

  it 'should expose postQuery on build as a property', ->
    root.ShareCoffee.REST.Search.build.should.have.property 'postQuery'
    root.ShareCoffee.REST.Search.build.postQuery.should.be.an 'object'

  it 'should expose suggest on build as a property', ->
    root.ShareCoffee.REST.Search.build.should.have.property 'suggest'
    root.ShareCoffee.REST.Search.build.suggest.should.be.an 'object'

  it 'should expose for on suggest as a property', ->
    root.ShareCoffee.REST.Search.build.suggest.should.have.property 'for'
    root.ShareCoffee.REST.Search.build.suggest.for.should.be.an 'object'

  it 'should expose for on query as a property', ->
    root.ShareCoffee.REST.Search.build.query.should.have.property 'for'
    root.ShareCoffee.REST.Search.build.query.for.should.be.an 'object'

  it 'should expose for on postQuery as a property', ->
    root.ShareCoffee.REST.Search.build.postQuery.should.have.property 'for'
    root.ShareCoffee.REST.Search.build.postQuery.for.should.be.an 'object'

  it 'should create a new instance of ShareCoffee.RESTFactory internally when query is accessed with GET', ->

    res = root.ShareCoffee.REST.Search.build.query.for
    res.should.be.an 'object'
    res.should.have.property 'method'
    res.method.should.be.an 'string'
    res.method.should.equal 'GET'

  it 'should create a new instance of ShareCoffee.RESTFactory internally when postQuery is accessed with POST', ->

    res = root.ShareCoffee.REST.Search.build.postQuery.for
    res.should.be.an 'object'
    res.should.have.property 'method'
    res.method.should.be.an 'string'
    res.method.should.equal 'POST'

  it 'should create a new instance of ShareCoffee.RESTFactory internally when suggest is accessed with GET', ->

    res = root.ShareCoffee.REST.Search.build.suggest.for
    res.should.be.an 'object'
    res.should.have.property 'method'
    res.method.should.be.an 'string'
    res.method.should.equal 'GET'
