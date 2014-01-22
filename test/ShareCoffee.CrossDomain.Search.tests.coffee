chai = require 'chai'
sinon = require 'sinon'
chai.should()

root = global ? window


describe 'ShareCoffee.CrossDomain.Search.Core', ->

  it 'should throw an loadError when ShareCoffee is not loaded', ->
    (-> require('../src/ShareCoffee.CrossDomain.Search')).should.throw ''



describe 'ShareCoffee.CrossDomain.Search.Core', ->

  before () ->
    #Fake that ShareCoffee has been loaded
    root.ShareCoffee =
      CrossDomain: {}
      CrossDomainRESTFactory: (method) ->
        {method: method}

    require '../src/ShareCoffee.CrossDomain.Search'

  it 'should register a Search subnamespace on ShareCoffee.CrossDomain', ->
    root.ShareCoffee.CrossDomain.should.have.property 'Search'
    root.ShareCoffee.CrossDomain.Search.should.be.an 'object'

  it 'should expose an build property on Search', ->
    root.ShareCoffee.CrossDomain.Search.should.have.property 'build'
    root.ShareCoffee.CrossDomain.Search.build.should.be.an 'object'

  it 'should expose query on build as a property', ->
    root.ShareCoffee.CrossDomain.Search.build.should.have.property 'query'
    root.ShareCoffee.CrossDomain.Search.build.query.should.be.an 'object'

  it 'should expose postQuery on build as a property', ->
    root.ShareCoffee.CrossDomain.Search.build.should.have.property 'postQuery'
    root.ShareCoffee.CrossDomain.Search.build.postQuery.should.be.an 'object'

  it 'should expose suggest on build as a property', ->
    root.ShareCoffee.CrossDomain.Search.build.should.have.property 'suggest'
    root.ShareCoffee.CrossDomain.Search.build.suggest.should.be.an 'object'

  it 'should expose for on suggest as a property', ->
    root.ShareCoffee.CrossDomain.Search.build.suggest.should.have.property 'for'
    root.ShareCoffee.CrossDomain.Search.build.suggest.for.should.be.an 'object'

  it 'should expose for on query as a property', ->
    root.ShareCoffee.CrossDomain.Search.build.query.should.have.property 'for'
    root.ShareCoffee.CrossDomain.Search.build.query.for.should.be.an 'object'

  it 'should expose for on postQuery as a property', ->
    root.ShareCoffee.CrossDomain.Search.build.postQuery.should.have.property 'for'
    root.ShareCoffee.CrossDomain.Search.build.postQuery.for.should.be.an 'object'

  it 'should create a new instance of ShareCoffee.CrossDomainRESTFactory internally when query is accessed with GET', ->

    res = root.ShareCoffee.CrossDomain.Search.build.query.for
    res.should.be.an 'object'
    res.should.have.property 'method'
    res.method.should.be.an 'string'
    res.method.should.equal 'GET'

  it 'should create a new instance of ShareCoffee.CrossDomainRESTFactory internally when postQuery is accessed with POST', ->

    res = root.ShareCoffee.CrossDomain.Search.build.postQuery.for
    res.should.be.an 'object'
    res.should.have.property 'method'
    res.method.should.be.an 'string'
    res.method.should.equal 'POST'

  it 'should create a new instance of ShareCoffee.CrossDomainRESTFactory internally when suggest is accessed with GET', ->

    res = root.ShareCoffee.CrossDomain.Search.build.suggest.for
    res.should.be.an 'object'
    res.should.have.property 'method'
    res.method.should.be.an 'string'
    res.method.should.equal 'GET'
